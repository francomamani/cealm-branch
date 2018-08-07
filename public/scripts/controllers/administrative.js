app.controller('AdministrativeCtrl', ['$scope',
	'$cookieStore', function ($scope, $cookieStore) {
	$scope.user = {
		"id" : $cookieStore.get("id"),
		"role" : $cookieStore.get("role"),
		"firstname" : $cookieStore.get("firstname"),
		"lastname" : $cookieStore.get("lastname")
	}
}])