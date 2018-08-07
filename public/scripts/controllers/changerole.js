app.controller('ChangeRoleCtrl', ['$scope', 
	'$modalInstance', 
	'title', 
	'user', 
	'User', 
	'$timeout', 
	function ($scope, $modalInstance, title, user, User, $timeout) {

	$scope.title = title;
	$scope.user = user;
	$scope.role = "";
	$scope.changeRole = function () {
		$scope.user.role = $scope.role;
		User.updateRole($scope.user).success(function (data) {
			console.log(data);
			if (data.error) {
				toastr.error("Ups... hubo un error en el cambio de rol");
			}else{
				toastr.success(data.success, "Felicidades");
				$timeout(function() {
					$modalInstance.close();
				}, 500);
			}
		});
	}

	$scope.cancel = function () {
		$modalInstance.dismiss('cancel');
	}

}]);