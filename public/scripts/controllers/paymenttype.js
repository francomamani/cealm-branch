app.controller('PaymentTypeCtrl', ['$scope', 'Restangular', '$modal', '$log', function ($scope, Restangular, $modal, $log) {
	$scope.payment_types = Restangular.all('auth/payment_types').getList().$object;
	$scope.save = function (paymentType) {
		Restangular.all('auth/payment_types').post(paymentType).then(function (data) {
			$scope.paymentType = {};
			toastr.success("Tipo de pago registrado");
			$scope.payment_types.push(data);
		});
	}
	$scope.delete = function (paymentType, index) {
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
					return "Esta seguro de eliminar a "+ paymentType.description +"?";
				} 
			}
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function (data) {
			paymentType.remove();
			$scope.payment_types.splice(index, 1);
			if (data.error) {
				toastr.error(data.error);
			}else{
				toastr.success(data.success);
			}
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});
	}
	$scope.update = function (paymentType) {
		paymentType.put().then(function () {
			paymentType.update  = false;
		});
	}
}]);