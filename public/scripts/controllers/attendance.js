app.controller('AttendanceCtrl', ['$scope', 'Restangular', '$http', function ($scope, Restangular, $http) {
	$scope.showSearch = false;
	$scope.empty = false;
	$scope.selectObject = function (u) {
		$scope.value = u.lastname + " " + u.firstname;
		$scope.user = u;
		$scope.showSearch = false;
		$scope.empty =  false;
	}
	$scope.search = function (value) {
		$http.post('api/v1/auth/search_users/', {value: value}).success(function (data) {
			$scope.showSearch = true;
			$scope.users = data;
			if (data.error) {
				$scope.empty = true;
			}else{
				$scope.empty = false;
			}
		});
	}

	$scope.searchAttendances = function (attendance) {
		attendance.user_id = $scope.user.id;
		$http.post('api/v1/auth/search_attendances', attendance).success(function (data) {
			$scope.list  = data;
		});
	}

	$scope.print = function () {
		var w = window.open("", "_blank", "toolbar=no, scrollbars=yes, resizable=no, top=200, left=300, width=600, height=400");
		w.document.write($('#searchTable').html());
		w.print();
		w.close();
	}

}]);