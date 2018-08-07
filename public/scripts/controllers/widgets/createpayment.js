app.controller('CreatePaymentCtrl', ['$scope', 'Restangular', '$modalInstance', function ($scope, Restangular, $modalInstance) {
	$scope.save = function (payment) {
		var date = new Date();
		var month = date.getUTCMonth() + 1;
		var day = date.getUTCDate();
		if (day < 10) day = "0"+day;
		var current_date =  date.getUTCFullYear()+'-'+ month  +'-'+day;
		var user = JSON.parse(localStorage.getItem('user'));
		
		payment.payment_date = current_date;
		payment.user_id = user.id;
		payment.identity_card = user.identity_card;
		Restangular.all('auth/payments').post(payment).then(function () {
			$modalInstance.close();
		});
	}
}]);