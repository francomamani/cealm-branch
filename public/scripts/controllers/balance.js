app.controller('BalanceCtrl', ['$scope',
 'Restangular',
 '$log',
 '$modal',
 'Calendar',
 '$http',
 'Currency',
 '$timeout',
 function ($scope, Restangular, $log, $modal, Calendar, $http, Currency, $timeout) {
	$scope.tab = "ingresos";
	$scope.results = {};
	$scope.egresos = [];
	$scope.status ="";
	$scope.showSearch = false;
	$scope.user = JSON.parse(localStorage.getItem('user'));
	$scope.current_balance = {};
	$scope.depositTypes = Restangular.all('auth/deposit_types').getList().$object;
	$scope.tipo_pagos = Restangular.all('auth/payment_types').getList().$object;
	$scope.balances = Restangular.all('auth/balances').getList().$object;
	var current_date = Calendar.currentDate();
	$scope.deposits = {};
	$scope.payments = {};
	$scope.estudiante = {
		'apellido' : '',
		'nombre' : ''
	};
	$scope.show_deposit_items = 0;
	$scope.show_payment_items = 0;

	$scope.months = Calendar.months();
	$scope.years = Calendar.years();
	$scope.payment_types = Restangular.all('auth/payment_types').getList().$object;

	/* Detalles de ingresos, egresos y saldos */

	$scope.detalleIngresos = [];
	$scope.detalleEgresos = [];
	$scope.saldo = 0;
	$scope.tipoDetalle = 'ingresos';

	$scope.date = Calendar.currentDate();
	Restangular.one('auth/current_balance').get().then(function (object) {
		$scope.current_balance = object;
		console.log($scope.current_balance);
		Restangular.one('auth/balances/'+object.id+'/deposits').get().then(function (data) {
			$scope.deposits = data;
		});
		Restangular.one('auth/balances/'+object.id+'/payments').get().then(function (data) {
			$scope.payments = data;
		});
		$scope.deposit = {
			balance_id: $scope.current_balance.id,
			amount: 0.00,
			student_id: 0,
			deposit_date: current_date.year+'-'+current_date.month+'-'+current_date.day,
			client: "",
			client_identity_card: "",
			user_id: $scope.user.id,
			identity_card: $scope.user.identity_card
		}
		$scope.payment = {
			balance_id: $scope.current_balance.id,
			user_id: $scope.user.id,
			amount: 0.00,
			payment_date: current_date.year+'-'+current_date.month+'-'+current_date.day,
			creditor: "",
			creditor_ci: ""
		}
	});

	$scope.updateBalance = function () {
		Restangular.one('auth/current_balance').get().then(function (object) {
			$scope.current_balance = object;
			Restangular.one('auth/balances/'+object.id+'/deposits').get().then(function (data) {
				$scope.deposits = data;
			});
			Restangular.one('auth/balances/'+object.id+'/payments').get().then(function (data) {
				$scope.payments = data;
			});
			$scope.deposit = {
				balance_id: $scope.current_balance.id,
				amount: 0.00,
				student_id: 0,
				deposit_date: current_date.year+'-'+current_date.month+'-'+current_date.day,
				client: "",
				client_identity_card: "",
				user_id: $scope.user.id,
				identity_card: $scope.user.identity_card
			}
			$scope.payment = {
				balance_id: $scope.current_balance.id,
				user_id: $scope.user.id,
				amount: 0.00,
				payment_date: current_date.year+'-'+current_date.month+'-'+current_date.day,
				creditor: "",
				creditor_ci: ""
			}
		});
	}

	$scope.deposits = [];
	$scope.selectObject = function (s) {
		$scope.value = s.lastname + " " + s.firstname;
		$scope.deposit.student_id = s.student_id;
		$scope.showSearch = false;
		$scope.empty =  false;
	}

	$scope.search = function (value) {
		Restangular.all('auth/get_search_students/'+value).getList().then(function (data) {
			$scope.showSearch = true;
			$scope.students = data;
			if (data.length == 0) {
				$scope.empty = true;
			}else{
				$scope.empty = false;
			}
		});
	}

	$scope.monthlyOpening = function () {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/monthlyOpening.html', 
			controller: 'MonthlyOpeningCtrl', 
			size: 'md'
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function () {
			$scope.updateBalance();
			toastr.success('Apertura mensual en linea');
		}, function () {
//			$log.info("Confirmación cancelada a las: "+ new Date());
		});
	}

	$scope.saveDeposit = function (deposit) {
		Restangular.all('auth/deposits').post(deposit).then(function (object) {
			console.log('depuracion');
			console.log(object);
			$scope.deposits.data.unshift(object);
			$scope.deposit.amount = 0.00;
			$scope.deposit.student_id = 0;
			$scope.deposit.client = "";
			$scope.deposit.client_identity_card = "";
		});
	}
	$scope.changeDepositPage = function (new_page) {
		Restangular.one('auth/balances/'+$scope.current_balance.id+'/deposits?page='+new_page).get().then(function (data) {
			$scope.deposits = data;
		});
	}
	$scope.printDeposit = function (deposit) {
		$scope.selectedDeposit = deposit;
		Restangular.all('auth/deposit_items_by_deposit/'+deposit.id).getList().then(function (data) {
			$scope.depositItems = data;
		});		

		$scope.selectedDeposit.literal_amount = Currency.NumeroALetras(Math.floor(deposit.amount));
		var decimal = Math.round(deposit.amount % 1 * 100);
		if (decimal == 0) {
			$scope.selectedDeposit.decimal_amount  = "0" + decimal.toString();
		}else{
			$scope.selectedDeposit.decimal_amount  = decimal.toString();			
		}
		$timeout(function () {
			var w = window.open("", "_blank", "toolbar=no, scrollbars=yes, resizable=no, top=200, left=300, width=600, height=400");
			w.document.write($('#print-deposit').html());
			w.print();
			w.close();
		}, 1000);
	}

	$scope.deleteDeposit = function (deposit, index) {
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
					return "Esta seguro de eliminar el depósito de " +deposit.amount +"?"
				} 
			}
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function () {
			$http.delete('api/v1/auth/deposits/'+deposit.id).success(function (data) {
				$scope.deposits.data.splice(index, 1);
				toastr.success(data.success);
			});
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});
				
	}

	$scope.show_deposit_items = 0;
	$scope.selectedDeposit = {};
	$scope.depositItems = [];
	$scope.showDepositItems = function (deposit) {
		$scope.show_deposit_items = 1;
		$scope.selectedDeposit = deposit;
		$scope.selectedDeposit.subtotal = 0;
		Restangular.all('auth/deposit_items_by_deposit/'+deposit.id).getList().then(function (data) {
			$scope.depositItems = data;
			for (var i = 0; i < data.length; i++) {
				$scope.selectedDeposit.subtotal += data[i].amount;
			};
		});
	}

	$scope.createDepositItem = function () {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/createDepositItem.html', 
			controller: 'CreateDepositItemCtrl', 
			size: 'md', 
			resolve: {
				deposit: function () {
					return $scope.selectedDeposit;
				}
			}
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function (data) {
			if (data.error) {
				toastr.error(data.error);
			}else{
				$scope.selectedDeposit.subtotal = $scope.selectedDeposit.subtotal + parseFloat(data.amount);
				$scope.depositItems.unshift(data);
			}
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});	
	}

	$scope.deleteDepositItem = function (deposit_item, index) {
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
					return "Esta seguro de eliminar el deposito con monto: " + deposit_item.amount +"?"
				} 
			}
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function () {
			$http.delete('api/v1/auth/deposit_items/'+deposit_item.id).success(function () {
				$scope.selectedDeposit.subtotal -= deposit_item.amount;
				$scope.depositItems.splice(index, 1);
			});
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});		
	}
	$scope.editDepositItem = function (depositItem) {
		depositItem.update = true;
		$scope.selectedDeposit.subtotal -= depositItem.amount;
	}

	$scope.updateDepositItem = function (depositItem) {
		if ($scope.selectedDeposit.subtotal + parseFloat(depositItem.amount) <= $scope.selectedDeposit.amount) {		
			$http.put('api/v1/auth/deposit_items/'+depositItem.id, depositItem).success(function (data) {
				depositItem.update = false;
				$scope.selectedDeposit.subtotal =  $scope.selectedDeposit.subtotal + parseFloat(depositItem.amount) ; 
			});
		}else{
			toastr.error('Monto fuera de rango');
		}
	}
	$scope.selectedPayment = {};
	$scope.savePayment = function (payment) {
		Restangular.all('auth/payments').post(payment).then(function (object) {
			$scope.payments.data.unshift(object);
			$scope.payment.amount = 0.00;
			$scope.payment.creditor = "";
			$scope.payment.creditor_ci = "";
		});
	}
	$scope.changePaymentPage = function (new_page) {
		Restangular.one('auth/balances/'+$scope.current_balance.id+'/payments?page='+new_page).get().then(function (data) {
			$scope.payments = data;
		});
	}
	$scope.showPaymentItems = function  (payment) {

		payment.subtotal = 0;
		$scope.selectedPayment = payment;
		$scope.show_payment_items = 1;
		Restangular.all('auth/payment_items_by_payment/'+payment.id).getList().then(function (data) {
			$scope.paymentItems = data;
			for (var i = 0; i < data.length; i++) {
				payment.subtotal += data[i].amount;
			};
			$scope.payment = payment;			
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
	$scope.printPayment = function (payment) {
		$scope.selectedPayment = payment;
		Restangular.all('auth/payment_items_by_payment/'+payment.id).getList().then(function (data) {
			$scope.paymentItems = data;
		});		
		$scope.selectedPayment.literal_amount = Currency.NumeroALetras(Math.floor(payment.amount));
		var decimal = Math.round(payment.amount % 1 * 100);
		if (decimal == 0) {
			$scope.selectedPayment.decimal_amount  = "0" + decimal.toString();
		}else{
			$scope.selectedPayment.decimal_amount  = decimal.toString();			
		}
		$timeout(function () {
			var w = window.open("", "_blank", "toolbar=no, scrollbars=yes, resizable=no, top=200, left=300, width=600, height=400");
			w.document.write($('#print-payment').html());
			w.print();
			w.close();
		}, 1000);
	}	
	$scope.createPaymentItem = function () {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/paymentItem.html', 
			controller: 'PaymentItemCtrl', 
			size: 'md', 
			resolve: {
				payment: function () {
					return $scope.selectedPayment;
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

	$scope.query = function (balance) {
		$scope.status ="balance";
		if (balance.month == 'null' || balance.year == 'null' ) { toastr.error('Por favor llene el formulario'); };		
		$scope.results = Restangular.one('/auth/balance/'+balance.month+'/'+balance.year).get().$object;
	}
	$scope.income = function (balance) {
		$scope.status ="income";
		if (balance.month == 'null' || balance.year == 'null' ) { toastr.error('Por favor llene el formulario'); };		
		$scope.income_results = Restangular.one('/auth/income/'+balance.month+'/'+balance.year).get().$object;
	}
	$scope.expenditure = function (balance) {
		$scope.status ="expenditure";
		if (balance.month == 'null' || balance.year == 'null' ) { toastr.error('Por favor llene el formulario'); };		
		$scope.expenditure_results = Restangular.one('/auth/expenditure/'+balance.month+'/'+balance.year).get().$object;
	}

	$scope.consultarIngreso = function () {
		var datos = {
			'balance_id' : $scope.current_balance.id,
			'user_id' : $scope.user.id
		};
        Restangular.all('auth/consultar-ingreso').post(datos).then(function (ingresos) {
            ingresos.forEach(function (item) {
                    item.estudiante = {};
                    item.user = {};
            });
            ingresos.forEach(function (item) {
                Restangular.one('auth/students/'+item.student_id).get().then(function (estudiante) {
                    Restangular.one('auth/users/'+estudiante.user_id).get().then(function (user) {
                        item.user = user;
                    });
                    item.estudiante = estudiante;
                });
            });
            $scope.ingresos = ingresos;
        });

    }

    $scope.encontrarEstudiante = function (ingreso, estudiante) {
		return ingreso.user.firstname.toLowerCase().search(estudiante.nombre.toLowerCase()) > -1
			|| ingreso.user.lastname.toLowerCase().search(estudiante.apellido.toLowerCase()) > -1 ;
    }

    $scope.consultarEgreso = function (consulta_egreso) {
        Restangular.all('auth/consultar-egreso').post(consulta_egreso).then(function (object) {
        	$scope.egresos = object;
        	console.log($scope.egresos);
        });
    }
    
    $scope.consultaSaldo = function (balance_id) {

    }
    $scope.detalleIngreso = function (balance_id) {
		$scope.tipoDetalle = 'ingresos';
        Restangular.one('auth/detalle-ingreso/'+balance_id).get().then(function (data) {
			$scope.detalleIngresos = data.ingresos;
			$scope.totalIngresos = data.total_ingresos;
			console.log('detalle de ingresos');
			console.log(data);
        });
    }
    
    $scope.detalleEgreso = function (balance_id) {
        $scope.tipoDetalle = 'egresos';
        Restangular.one('auth/detalle-egreso/'+balance_id).get().then(function (data) {
            $scope.detalleEgresos= data.egresos;
            $scope.totalEgresos= data.total_egresos;
            console.log('detalle de egresos');
            console.log(data);
        });
    }
    $scope.consultaSaldo = function (balance_id) {
        $scope.tipoDetalle = 'saldo';
        Restangular.one('auth/consultar-saldo/'+balance_id).get().then(function (data) {
            $scope.saldo= data.saldo;
            console.log('Saldo');
            console.log(data);
        });
    }
    

}]);