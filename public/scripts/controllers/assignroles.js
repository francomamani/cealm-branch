app.controller('AssignRolesCtrl', ['$scope', 
	'User',
	'Restangular',
	'$http',
	'$q',	
	function ($scope, User, Restangular, $http, $q) {
	$scope.user = {
		id: ''
	};
	$scope.showInfo = false;
	$scope.roles = {};
	$scope.users = [];
	$scope.value = "";
	$scope.role = {
		user_id: '',
		role_id: '',
		type: '',
		level: ''
	};
	$scope.$watch('user.id', function () {
		$scope.role.user_id = $scope.user.id;
	});
	$scope.search =  function () {
		if ($scope.value != "") {	
			User.search({value: $scope.value}).then(function (data) {
				$scope.users = data;
			});
		};
		$scope.showInfo = true;
	}
	$scope.getRoles = function () {
		$scope.roles = Restangular.one('auth/user_roles/'+$scope.user.id).get().$object;
	}
	$scope.select = function (user) {
		$scope.user = user;
		$scope.roles = Restangular.one('auth/user_roles/'+user.id).get().$object;
	}
	$scope.assignRole = function (role) {
		var deferred = $q.defer();
		$http.post('api/v1/auth/assign_roles', $scope.role).success(function  (data) {
			deferred.resolve(data);
		}).error(function (reason) {
			deferred.reject(reason);
		});
		deferred.promise.then(function (data) {
			if (data.success){
				toastr.success(data.success);
			}else{
				if (data.error)
					toastr.error(data.error);
			}
		});
		$scope.getRoles();
	}
	
}])