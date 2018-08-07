app.controller('DepositCtrl', ['$scope',
 'Restangular',
 '$modal',
 '$log',
 '$http',
 'Currency',
 '$timeout',
 'Calendar',
  function ($scope, Restangular, $modal, $log, $http, Currency, $timeout, Calendar) {

  	$scope.user = JSON.parse(localStorage.getItem('user'));
  	$scope.date = Calendar.currentDate();
	$scope.depositTypes = Restangular.all('auth/deposit_types').getList().$object;

	$scope.showDetails = false;
	$http.get('api/v1/auth/deposits').success(function (data) {
		$scope.deposits = data;
		$scope.bigTotalItems = data.total;
		$scope.maxSize = 5;
		$scope.bigCurrentPage = data.current_page;
		$scope.numPages = data.last_page;
		$scope.bigPerPage = data.per_page;
	});

	$scope.createDeposit = function () {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/createDeposit.html', 
			controller: 'CreateDepositCtrl', 
			size: 'md' 
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function (data) {
			$scope.deposits.data.unshift(data);
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});	
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
	$scope.moreDetails = function (deposit) {
		$scope.deposit  = deposit;
		$scope.deposit.subtotal = 0;
		$scope.showDetails = true;
		$http.get('api/v1/auth/deposit_items_by_deposit/'+deposit.id).success(function (data) {
			$scope.depositItems = data;
			for (var i = 0; i < data.length; i++) {
				$scope.deposit.subtotal += data[i].amount;
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
					return $scope.deposit;
				}
			}
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function (data) {
			if (data.error) {
				toastr.error(data.error);
			}else{
				$scope.deposit.subtotal = $scope.deposit.subtotal + parseFloat(data.amount);
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
				$scope.deposit.subtotal -= deposit_item.amount;
				$scope.depositItems.splice(index, 1);
			});
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});		
	}
	$scope.editDepositItem = function (depositItem) {
		depositItem.update = true;
		$scope.deposit.subtotal -= depositItem.amount;
	}

	$scope.updateDepositItem = function (depositItem) {
		if ($scope.deposit.subtotal + parseFloat(depositItem.amount) <= $scope.deposit.amount) {		
			$http.put('api/v1/auth/deposit_items/'+depositItem.id, depositItem).success(function (data) {
				depositItem.update = false;
				$scope.deposit.subtotal =  $scope.deposit.subtotal + parseFloat(depositItem.amount) ; 
			});
		}else{
			toastr.error('Monto fuera de rango');
		}
	}

	$scope.print = function (deposit) {
		$scope.deposit = deposit;
		Restangular.all('auth/deposit_items_by_deposit/'+deposit.id).getList().then(function (data) {
			$scope.depositItems = data;
		});		

		$scope.deposit.literal_amount = Currency.NumeroALetras(Math.floor(deposit.amount));
		var decimal = Math.round(deposit.amount % 1 * 100);
		if (decimal == 0) {
			$scope.deposit.decimal_amount  = "0" + decimal.toString();
		}else{
			$scope.deposit.decimal_amount  = decimal.toString();			
		}
		$timeout(function () {
			var w = window.open("", "_blank", "toolbar=no, scrollbars=yes, resizable=no, top=200, left=300, width=600, height=400");
			w.document.write($('#section-to-print').html());
			w.print();
			w.close();
		}, 1000);
	}
	/*pagination*/
	$scope.changePage = function (new_page) {
		$http.get('api/v1/auth/deposits?page='+new_page).success(function (data) {
			$scope.deposits = data;
		});
	}
	/*end-pagination*/
}]);