app.controller('MonthlyOpeningCtrl', ['$scope',
 '$modalInstance',
 'Restangular',
 function ($scope, $modalInstance, Restangular) {
	var current_date = new Date();
	$scope.balance = {
		opening_balance: 0.0,
		closing_balance: 0.0,
		month: current_date.getUTCMonth() + 1,
		year: current_date.getUTCFullYear(),
		status: 'abierto'
	};
	$scope.store = function (balance) {
		if (balance.month > current_date.getUTCMonth() + 1) {			
				toastr.error("El mes registrado no coincide para la apertura.");
		}else{
			Restangular.all('auth/balances').post(balance).then(function (object) {
				if (typeof object.error !== 'undefined') {
					toastr.error(object.error);
					$modalInstance.close();
				}else{
					toastr.success('La apertura mensual fue registrada exitosamente.');
					$modalInstance.close(object);
				}
			});		
		}
	}
	$scope.cancel = function () {
		$modalInstance.close();
	}
	
}]);