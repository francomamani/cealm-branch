app.controller('CreateDepositItemCtrl', ['$scope',
 'deposit',
 '$modalInstance',
 'Restangular',
 'Calendar',
 function ($scope, deposit, $modalInstance, Restangular, Calendar) {
 	$scope.months = Calendar.months();
 	$scope.deposit = deposit;
 	$scope.deposit_types = Restangular.all('auth/deposit_types').getList().$object;
	$scope.saveDepositItem = function (deposit_item) {
		$scope.deposit_item = deposit_item;
		$scope.deposit_item.deposit_id = $scope.deposit.id;
		if (parseFloat(deposit.subtotal) + parseFloat(deposit_item.amount) <= deposit.amount  ) {			
			Restangular.all('auth/deposit_items').post($scope.deposit_item).then(function (data) {
				$modalInstance.close(data);
			});
		}else{
			$modalInstance.close({ error: "Monto de deposito fuera de rango"} );
		}
	}

}]);