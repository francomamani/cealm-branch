app.controller('PaymentItemCtrl', ['$scope',
 '$modalInstance',
 'Restangular',
 'Calendar',
 'payment',
 function ($scope, $modalInstance, Restangular, Calendar, payment) {
 	$scope.payment = payment;
 	$scope.payment_types = Restangular.all('auth/payment_types').getList().$object;
 	$scope.months = Calendar.months();
 	$scope.years = Calendar.years();

	$scope.save = function (paymentItem) {
		paymentItem.payment_id = $scope.payment.id;
		Restangular.all('auth/payment_items').post(paymentItem).then(function (data) {
			$modalInstance.close(data);
		});
	}

}]);