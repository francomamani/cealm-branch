app.controller('RecordPricesCtrl', ['$scope', 'Restangular', '$modal', '$log', function ($scope, Restangular, $modal, $log) {
	$scope.price = {
		description: "",
		price: 0.00
	};
	$scope.$watch('price.description', function () {
		$scope.price.description =  angular.uppercase($scope.price.description);
	});
	$scope.prices = Restangular.all('auth/prices').getList().$object;
	$scope.save = function (price) {
		var local_price = price;
		$scope.price = {};
		Restangular.all('auth/prices').post(local_price).then(function (data) {
			if (data.error) {
				toastr.error(data.error);
			}else{
				toastr.success("Precio Registrado");
				$scope.prices.push(data);
			}
		});
	}
	$scope.delete = function (price, index) {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/confirm.html', 
			controller: 'ConfirmCtrl', 
			size: 'md', 
			resolve: {
				title: function () {
					return "Confirmar"; 
				},
				message: function () {
					return "Esta seguro de eliminar el item: " + price.description +"?";
				} 
			}
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function () {
			price.remove();
			toastr.success("Item eliminado");
			$scope.prices.splice(index, 1);
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});		
	}
	$scope.update = function (price) {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/updatePrice.html', 
			controller: 'UpdatePriceCtrl', 
			size: 'md', 
			resolve: {
				title: function () {
					return "Actualizar Items"; 
				},
				price: function () {
					return price;
				} 
			}
		};
		$modal.open(settings);
/*		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function () {
			$scope.deleteUser(user);
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});		*/
	}

}]);