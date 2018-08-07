app.controller('RoleCtrl', ['$scope',
	'Restangular',
	'Control',
	'$location', 
	'$cookieStore', 
	'ROLES',
	function ($scope, Restangular, Control, $location, $cookieStore, ROLES) {
	$scope.roles = Restangular.one('auth/roles').get().$object;

	$scope.chooseRole = function (role) {
		var role = parseInt(role.id);
		console.log('role');
		console.log(role);
		localStorage.setItem('role', role);
		switch(role){
				case 0:$location.path(ROLES.CONTROL.PATH);break;
				case 1:$location.path(ROLES.ADMIN.PATH);break;
				case 2:$location.path(ROLES.ADMINISTRATIVO.PATH);break;
				case 3:$location.path(ROLES.PROFESOR.PATH);break;
				case 4:$location.path(ROLES.ESTUDIANTE.PATH);break;
				default: $location.path("/");break;
		}
	}
}]);