app.controller('ControlCtrl', ['$scope', '$http', 'Restangular', function ($scope, $http, Restangular) {
	$scope.record_type = true;
	$scope.clean = function () {
		$scope.attendance = {};
		$("#code").focus(); 
	}	

	$scope.attendances = Restangular.all('auth/attendances').getList().$object;
	$scope.saveAttendance = function (attendance) {
		$http.get('api/v1/auth/information_by_user/'+attendance.username+"/"+attendance.code).success(function (data) {
			if (data.error) {
				toastr.error(data.error);
			}else{
				$scope.user = data;
				if ($scope.record_type) {
					$scope.user.record_type = 'entrada';
				}else{
					$scope.user.record_type = 'salida';					
				}
				Restangular.all('auth/attendances').post($scope.user).then(function (data) {
					$scope.attendance = {};
					$scope.attendances.unshift(data);
					$('#attendanceModal').modal('show');
				});
			}
		});
	}
}]);