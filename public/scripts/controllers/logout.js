app.controller('LogoutCtrl', ['$scope', 
	'$cookieStore', 
	'$location', 
	'Auth', 
	'Control', function ($scope, $cookieStore, $location, Auth, Control) {
		$scope.$parent.items = [];
			$scope.main.user = {};
			$cookieStore.remove("id");
			$cookieStore.remove("role");
			$cookieStore.remove("firstname");
			$cookieStore.remove("lastname");
			$cookieStore.remove("role");
			window.location.href = "/";				
/*
		Auth.logout().success(function (data) {
			if (data.success) {
				toastr.info(data.success);				
			};
			Control.update(5);
//			Control.update(5);
//			$location.path("/");
		});*/
}]);