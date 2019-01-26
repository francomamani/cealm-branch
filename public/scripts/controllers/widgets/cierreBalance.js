app.controller('CierreBalanceCtrl', ['$scope',
 '$modalInstance',
 'Restangular',
 'balance_id',
 function ($scope, $modalInstance, Restangular, balance_id) {
    $scope.balance = {
        'id': balance_id,
        'closing_balance' : 0
    };
	$scope.cerrarBalance = function (balance) {
	    console.log(balance);
        Restangular.all('auth/cerrar_balance/' + balance.id).post(balance).then(function (object) {
            toastr.success('Cierre correcto ' + object.month + '/' + object.year);
            $modalInstance.close(object);
        });
    }

	$scope.cancel = function () {
		$modalInstance.close();
	}
}]);