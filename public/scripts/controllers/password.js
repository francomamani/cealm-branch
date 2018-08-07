app.controller('PasswordCtrl', ['$scope', 
	'$http', 
	'Auth', 
	'ngDialog', 
	'$sce', 
	'$cookieStore', 
	'$location',
	'Control',
	'ROLES',
	'User',
	function ($scope, $http, Auth, ngDialog, $sce, $cookieStore, $location, Control, ROLES, User) {
		$scope.main = {
			user: {},
			password: {
				current_password: "",
				new_password: "",
				retype_new_password: ""
			}, 
			errors:{
				current_password: "",
				new_password: "", 
				retype_new_password: ""
			}
		};
		User.load().success(function (data) {
			$scope.main.user = data;
			console.log(data);
		}); 

		$scope.updatePassword = function (password) {
			$scope.main.errors = {
				current_password: "",
				new_password: "", 
				retype_new_password: ""
			};

			User.updatePassword(password).success(function (data) {
				if (data.new_password) 
					$scope.main.errors.new_password = data.new_password[0];
				if (data.retype_new_password)
					$scope.main.errors.retype_new_password = data.retype_new_password[0];
				if (data.error)
					$scope.main.errors.current_password = data.error;
				if (data.success){
					$scope.main.password = {};					
					toastr.success(data.success); 
				}
			}); 
		}

}]);