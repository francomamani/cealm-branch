app.controller('NavBarCtrl', ['$scope', 
	'$location', 
	'Auth',
	'Restangular',
	'$cookieStore',
	'Control',
	'$location',
	'ROLES', 
	function ($scope, $location, Auth, Restangular, $cookieStore, Control, $location, ROLES) {
	$scope.isLoggedIn = '';
	$scope.user = JSON.parse(localStorage.getItem('user'));
	Auth.isLoggedIn().then(function (data) {
		$scope.isLoggedIn = data;
	});

	Auth.showChangeRole().then(function (response) {
		$scope.showChangeRole =  response;
	});
	
	$scope.isAdmin = Auth.isAdmin();
	$scope.isAdministrative = Auth.isAdministrative();
	$scope.isTeacher = Auth.isTeacher();
	$scope.isStudent = Auth.isStudent();
	$scope.isControl = Auth.isControl();
	$scope.isPublic = Auth.isPublic();
	$scope.isActive = function(route) {
      console.log($location.path());
      return route === $location.path();
    };
	$scope.roles = Restangular.one('auth/roles').get().$object;
	$scope.logout = function () {
		Auth.logout();
		localStorage.removeItem('user');
		localStorage.removeItem('role');
		$location.path(ROLES.PUBLICO.PATH);
	}
/*	$scope.changeRole = function (role) {
//			Control.update(role);
			switch(role){
					case 0:$location.path(ROLES.CONTROL.PATH);break;
					case 1:$location.path(ROLES.ADMIN.PATH);break;
					case 2:$location.path(ROLES.ADMINISTRATIVO.PATH);break;
					case 3:$location.path(ROLES.PROFESOR.PATH);break;
					case 4:$location.path(ROLES.ESTUDIANTE.PATH);break;
					default: $location.path("/");break;
			}
			//$cookieStore.put("role", role);
	}*/

}]);