app.controller('ProfileCtrl', ['$scope', 
	'Restangular', 
	'$cookieStore', 
	'Auth', function ($scope, Restangular, $cookieStore, Auth) {
	$scope.user = Restangular.one('auth').get().$object;

}]);