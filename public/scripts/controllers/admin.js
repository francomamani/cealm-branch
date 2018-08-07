app.controller('AdminCtrl', ['$scope', 
	"$rootScope",
	"$cookieStore", function ($scope, $rootScope, $cookieStore) {
	$scope.user = {
		"id" : $cookieStore.get("id"),
		"role" : $cookieStore.get("role"),
		"firstname" : $cookieStore.get("firstname"),
		"lastname" : $cookieStore.get("lastname")
	}


}])