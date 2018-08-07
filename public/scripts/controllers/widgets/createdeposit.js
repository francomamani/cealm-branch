app.controller('CreateDepositCtrl', ['$scope',
 'Restangular',
 '$modalInstance',
 '$http',
 function ($scope, Restangular, $modalInstance, $http) {
 	$scope.students = [];
 	$scope.student = {};
 	/*search_students_global*/
	/*search_students*/
	$scope.showSearch = false;
	$scope.selectObject = function (s) {
		$scope.value = s.lastname + " " + s.firstname;
		$scope.student = s;
		$scope.showSearch = false;
		$scope.empty =  false;
	}
	$scope.search = function (value) {
		$http.get('api/v1/auth/get_search_students/'+value).success(function (data) {
			$scope.showSearch = true;
			$scope.students = data;
			if (data.length == 0) {
				$scope.empty = true;
			}else{
				$scope.empty = false;
			}
		});
	}
	$scope.save = function (deposit) {
		var date = new Date();
		var current_date = date.getUTCFullYear()+"-"+date.getUTCMonth()+"-"+date.getUTCDate();
		var user = JSON.parse(localStorage.getItem("user"));
		deposit.student_id = $scope.student.student_id;
		deposit.deposit_date = current_date;
		deposit.user_id = user.id;
		deposit.identity_card = user.identity_card;
		Restangular.all('auth/deposits').post(deposit).then(function (data) {
			$modalInstance.close(data);
		});
	}
}]);