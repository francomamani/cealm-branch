app.controller('UsersCtrl', ['$scope', 
	'Restangular',
	'$http', 
	'$q', 	
	'User', 
	'$modal', 
	'$log', function ($scope, Restangular, $http, $q, User, $modal, $log) {

	$scope.users = [];
	$scope.role_id = 4;
	$scope.value = ''; 

/*	User.all().success(function (data) {
		$scope.users = data; 
	}); */

	$scope.administradores = function () {
        $scope.users = [];
        Restangular.all('auth/administrators').getList().then(function (administrators) {
            for (var i = 0; i < administrators.length; i++) {
                var administrator = Restangular.one('auth/users/'+administrators[i].user_id).get().$object;
                $scope.users.push({role: administrators[i], data: administrator});
            };
        });
    }
    $scope.administrativos = function () {
        $scope.users = [];
        Restangular.all('auth/administratives').getList().then(function (administratives) {
            for (var i = 0; i < administratives.length; i++) {
                var administrative = Restangular.one('auth/users/'+administratives[i].user_id).get().$object;
                //$scope.users.push(administrative);
                $scope.users.push({role: administratives[i], data: administrative});
            };
        });
    }
    $scope.profesores = function () {
        $scope.users = [];
        Restangular.all('auth/teachers').getList().then(function (teachers) {
            for (var i = 0; i < teachers.length; i++) {
                var teacher = Restangular.one('auth/users/'+teachers[i].user_id).get().$object;
                $scope.users.push({role: teachers[i], data: teacher});
            };
        });
    }
    $scope.estudiantes = function () {
		$scope.users = [];
        Restangular.all('auth/students').getList().then(function (students) {
            for (var i = 0; i < students.length; i++) {
                var student = Restangular.one('auth/users/'+students[i].user_id).get().$object;
                $scope.users.push({role: students[i], data: student});
            };
        });
    }
	$scope.$watch('role_id', function () {
		if ($scope.role_id == 1) {
			$scope.administradores();
		}
		if ($scope.role_id == 2) {
			$scope.administrativos();
		}
		if ($scope.role_id == 3) {
			$scope.profesores();
		}
		if ($scope.role_id == 4) {
			$scope.estudiantes();
		}
	});	

	$scope.load = function  () {
		User.all().success(function (data) {
			$scope.users = data; 
		}); 
	}
	$scope.open = function (size, user) {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/confirm.html', 
			controller: 'ConfirmCtrl', 
			size: size, 
			resolve: {
				title: function () {
					return "Confirmar"; 
				},
				message: function () {
					return "Esta seguro de eliminar a " + user.data.firstname + " " + user.data.lastname +"?"
				} 
			}
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function () {
			$scope.deleteUser(user);
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});
	}

	$scope.changeRole = function (size, user) {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/changeRole.html', 
			controller: 'ChangeRoleCtrl', 
			size: size, 
			resolve: {
				title: function () {
					return "Cambiar Rol"; 
				},
				user: function () {
					return user;
				}
			}
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function () {
			$scope.load();
		}, function () {
			$log.info("Cambio de rol cancelado a las: "+ new Date());
		});	
	}

	$scope.changePage = function (new_page) {
		User.getPage(new_page).success(function (data) {
			$scope.users = data;
		}); 
	}

	$scope.deleteUser = function (user) {
		if ($scope.role_id == 1) {
			Restangular.one('auth/administrators/'+user.role.id).remove().then(function (data) {
				toastr.success(data.success);
			});
			$scope.administradores();
		};
		if ($scope.role_id == 2) {
			Restangular.one('auth/administratives/'+user.role.id).remove().then(function (data) {
				toastr.success(data.success);
			});
			$scope.administrativos();
		};
		if ($scope.role_id == 3) {
			Restangular.one('auth/teachers/'+user.role.id).remove().then(function (data) {
				toastr.success(data.success);
			});
			$scope.profesores();
		};
		if ($scope.role_id == 4) {
			Restangular.one('auth/students/'+user.role.id).remove().then(function (data) {
				toastr.success(data.success);
			});
			$scope.estudiantes();
		};

/*		User.delete(user.id).success(function (data) {
			$scope.users = data; 
		}); */
	}
	$scope.updateUser = function (user) {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/updateUser.html', 
			controller: 'UpdateUserCtrl', 
			size: 'lg', 
			resolve: {
				title: function () {
					return "Confirmar"; 
				},
				user: function () {
					return user.data;
				} 
			}
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function (data) {
			user.data = data;
			toastr.success('Usuario Actualizado exitosamente');
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});
	}
	$scope.resetPassword = function (user) {
		var pass = user.data.identity_card.split("-", 1)[0];
		Restangular.all('auth/reset_password').post({user_id: user.data.id, reset: pass}).then(function (data) {
			toastr.success(data.success);
		});
	}
}]);