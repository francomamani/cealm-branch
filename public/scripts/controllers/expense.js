app.controller('ExpenseCtrl', ['$scope', '$http', '$timeout', function ($scope, $http, $timeout) {
	$scope.showSearch = false;
	$scope.total = 0;

	$scope.search = function (value) {
		$http.get('api/v1/auth/search_payment_types/'+value).success(function (data) {
			$scope.showSearch = true;
			$scope.expense_types = data;
			if (data.length == 0) {
				$scope.empty = true;
			}else{
				$scope.empty = false;
			}
		});
	}
	$scope.selectObject = function (e) {
		$scope.value = e.description;
		$scope.expense_type = e;
		$scope.showSearch = false;
		$scope.empty =  false;
	}
	$scope.queries = function () {
		var json = {
			expense_type_id : $scope.expense_type.id,
			data 	: $scope.data,
			month	: parseInt($scope.month),
			year	: parseInt($scope.year)			
		};
		$http.post('api/v1/auth/expenses', json).success(function (data) { //query as expense
			$scope.list = data;
			$scope.total = 0;
			angular.forEach($scope.list, function (l) {
				$scope.total = $scope.total + parseFloat(l.amount);
			})
		});
	}
	$scope.print = function () {
		var w = window.open("", "_blank", "toolbar=no, scrollbars=yes, resizable=no, top=200, left=300, width=600, height=400");
		w.document.write($('#searchTable').html());
		w.print();
		w.close();
	}
}]);