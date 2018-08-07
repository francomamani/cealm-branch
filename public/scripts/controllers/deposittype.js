app.controller('DepositTypeCtrl', ['$scope', 'Restangular', '$modal', '$log', function ($scope, Restangular, $modal, $log) {
	$scope.deposit_types = Restangular.all('auth/deposit_types').getList().$object;
	$scope.save = function (depositType) {
		Restangular.all('auth/deposit_types').post(depositType).then(function (data) {
			$scope.depositType = {};
			toastr.success("Tipo de deposito registrado");
			$scope.deposit_types.push(data);
		});
	}
	$scope.delete = function (depositType, index) {
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
					return "Esta seguro de eliminar a "+ depositType.description +"?";
				} 
			}
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function (data) {
			depositType.remove();
			$scope.deposit_types.splice(index, 1);
			if (data.error) {
				toastr.error(data.error);
			}else{
				toastr.success(data.success);
			}
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});
	}
	$scope.update = function (depositType) {
		depositType.put().then(function () {
			depositType.update  = false;
		});
	}
}]);