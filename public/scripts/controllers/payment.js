app.controller('PaymentCtrl', ['$scope',
 'Restangular',
 '$log',
 '$modal',
 'Calendar',
 '$http',
 '$timeout',
 'Currency',
 function ($scope, Restangular, $log, $modal, Calendar, $http, $timeout, Currency) {
	$scope.statusDetails = false;
  	$scope.date = Calendar.currentDate();
	Restangular.one('auth/payments').get().then(function (data) {
		$scope.payments = data;
		
		$scope.bigTotalItems = data.total;
		$scope.maxSize = 5;
		$scope.bigCurrentPage = data.current_page;
		$scope.numPages = data.last_page;
		$scope.bigPerPage = data.per_page;
	});

	$scope.changePage = function (new_page) {
		$scope.payments = Restangular.one('auth/payments?page='+new_page).get().$object;
	}

	$scope.paymentItems = [];
	$scope.months = Calendar.months();
	$scope.years = Calendar.years();
	$scope.payment_types = Restangular.all('auth/payment_types').getList().$object;

	$scope.user = JSON.parse(localStorage.getItem('user'));
	$scope.recordPayment = function () {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/createPayment.html', 
			controller: 'CreatePaymentCtrl', 
			size: 'md'
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function (data) {
			$scope.payments = Restangular.one('auth/payments?page=1').get().$object;
			$scope.bigCurrentPage = 1;
			toastr.success("Registro de pago exitoso");
		}, function () {
			$log.info("Registro de pago cancelada a las: "+ new Date());
		});		
	}
	$scope.showDetails = function (payment) 
	{
		payment.subtotal = 0;
		$scope.statusDetails = true;
		$scope.payment = payment;			
		Restangular.all('auth/payment_items_by_payment/'+payment.id).getList().then(function (data) {
			$scope.paymentItems = data;
			for (var i = 0; i < data.length; i++) {
				payment.subtotal += data[i].amount;
			};
		});
	}
	$scope.deletePayment = function (payment, index) {
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
					return "¿Esta seguro de eliminar el pago de monto "+ payment.amount +" Bs.?";
				} 
			}
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function () {
			Restangular.one('auth/payments/'+payment.id).remove().then(function () {
				$scope.payments.data.splice(index, 1);
			});
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});
	}
	$scope.createPaymentItem = function () {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/paymentItem.html', 
			controller: 'PaymentItemCtrl', 
			size: 'md', 
			resolve: {
				payment: function () {
					return $scope.payment;
				} 
			}
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function (data) {
			if (data.error) {
				toastr.error(data.error);
			}else{
				$scope.payment.subtotal = $scope.payment.subtotal + data.amount; 
				$scope.paymentItems.push(data); 
			}			
		}, function () {
			$log.info("Pago de item cancelada a las: "+ new Date());
		});
	}
	$scope.deletePaymentItem = function (paymentItem, index) {
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
					return "¿Esta seguro de eliminar " + paymentItem.description +"?"
				} 
			}
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function () {
			Restangular.one('auth/payment_items/'+paymentItem.id).remove().then(function (data) {
				toastr.success(data.success);
				$scope.payment.subtotal = $scope.payment.subtotal - paymentItem.amount;
				$scope.paymentItems.splice(index, 1);
			});
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});	
	}
	$scope.hideStatus = function () {
		$scope.statusDetails = false;
		$scope.payment = {};
	}
	$scope.enablePaymentItem = function (paymentItem) {
		paymentItem.update = true
		$scope.payment.subtotal = $scope.payment.subtotal - paymentItem.amount;
	}
	$scope.updatePaymentItem = function (paymentItem) {
		$http.put('api/v1/auth/payment_items/'+paymentItem.id, paymentItem).success(function (data) {
			if (data.error) {
				toastr.error(data.error);
			}else{		
				paymentItem.amount = data.amount;
				paymentItem.month = data.month;
				paymentItem.year = data.year;
				paymentItem.additional_information = data.additional_information;
				paymentItem.description = data.description;
				paymentItem.update = false;
				$scope.payment.subtotal = $scope.payment.subtotal + data.amount;
			}
		});
	}
	$scope.print = function (payment) {
		$scope.payment = payment;
		Restangular.all('auth/payment_items_by_payment/'+payment.id).getList().then(function (data) {
			$scope.paymentItems = data;
		});		
		$scope.payment.literal_amount = Currency.NumeroALetras(Math.floor(payment.amount));
		var decimal = Math.round(payment.amount % 1 * 100);
		if (decimal == 0) {
			$scope.payment.decimal_amount  = "0" + decimal.toString();
		}else{
			$scope.payment.decimal_amount  = decimal.toString();			
		}
		$timeout(function () {
			var w = window.open("", "_blank", "toolbar=no, scrollbars=yes, resizable=no, top=200, left=300, width=600, height=400");
			w.document.write($('#section-to-print').html());
			w.print();
			w.close();
		}, 1000);
	}
}]);