app.controller('QueryCtrl', ['$scope', '$http', '$timeout', function ($scope, $http, $timeout) {
	$scope.showSearch = false;
	$scope.total = 0;
	$scope.search = function (value) {
		$http.get('api/v1/auth/search_deposit_types/'+value).success(function (data) {
			$scope.showSearch = true;
			$scope.deposit_types = data;
			if (data.length == 0) {
				$scope.empty = true;
			}else{
				$scope.empty = false;
			}
		});
	}
	$scope.selectObject = function (d) {
		$scope.value = d.description;
		$scope.deposit_type = d;
		$scope.showSearch = false;
		$scope.empty =  false;
	}
	$scope.queries = function () {
		var json = {
			deposit_type_id : $scope.deposit_type.id,
			data 	: $scope.data,
			month	: parseInt($scope.month),
			year	: parseInt($scope.year)			
		};
		$http.post('api/v1/auth/queries', json).success(function (data) {
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