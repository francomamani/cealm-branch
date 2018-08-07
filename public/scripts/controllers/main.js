app.controller('MainCtrl', ['$scope', 
	'Restangular',
	'$http', 
	'Auth', 
	'ngDialog', 
	'$sce', 
	'$cookieStore', 
	'$location',
	'Control',
	'ROLES',
	'$location', 
	'Calendar',
	function ($scope, Restangular, $http, Auth, ngDialog, $sce, $cookieStore, $location, Control, ROLES, $location, Calendar) {

	$scope.calendar = {
		days: Calendar.days(), 
		months: Calendar.months(), 
		years: Calendar.years(), 
	};
	$scope.day = "";
	$scope.month = "";
	$scope.year = "";
	$scope.identity_card_exp = "";

	$scope.main = {
		user: {
			firstname: "",
			lastname: "",
			email: "",
			birthday: "",
			gender: "",
			phone: "",
			cellphone: "",
			address: "",
			identity_card_number: "",
			identity_card: "",			
			occupation: "",
			contact_person: "",
			contact_person_phone: "",
			contact_person_cellphone: "",
			username: "",
			password: "",
			retype_password: ""
		}, 
		credentials: {
			username: "", 
			password: ""
		}
	};

	$scope.$watch('day', function () {
		$scope.main.user.birthday = $scope.year+"-"+$scope.month +"-"+ $scope.day; 
	});
	$scope.$watch('month', function () {
		$scope.main.user.birthday = $scope.year+"-"+$scope.month +"-"+ $scope.day; 
	});
	$scope.$watch('year', function () {
		$scope.main.user.birthday = $scope.year+"-"+$scope.month +"-"+ $scope.day; 
	});
	$scope.$watch('identity_card_number', function () {
		$scope.main.user.identity_card = $scope.main.user.identity_card_number+"-"+$scope.identity_card_exp;
	});
	$scope.$watch('identity_card_exp', function () {
		$scope.main.user.identity_card = $scope.main.user.identity_card_number+"-"+$scope.identity_card_exp;
	});

	$scope.items = [];

	$scope.loadAuth = function () {
		Auth.load().then(function (data) {
			Restangular.one('auth/roles').get().then(function (roles) {
			});
		});
	}
	$scope.logoutUser = function () {
		Auth.logout().success(function () {
			toastr.info('Acabas de cerrar tu sesion');
			$scope.main.user = {};
			localStorage.removeItem('user');
			localStorage.removeItem('role');
		});
	}
	$scope.loginUser = function () {
		Auth.login({
			username: $scope.main.credentials.username,
			password: $scope.main.credentials.password 
		}).then(function  (data) {
			if (data.error){
				toastr.error(data.error);
				$scope.main.credentials = {};
			}else{
				localStorage.setItem('user', JSON.stringify(data));
				Restangular.one('auth/roles').get().then(function (roles) {
					if (roles.num_roles == 0) {
						toastr.error('No tiene roles asociados, comuniquese con administracion');
					}else{
						$location.path('roles');
					}
					$scope.main.credentials = {};
				});

			}
		});
	}
	$scope.register = function () {
		Auth.register($scope.main.user).then(function (data) {
			if (data.error) {
				toastr.error(data.error);
			}else{
				toastr.success(data.success);				
			}
			$scope.main.user = {};
			$scope.identity_card_exp = '';
			$scope.year= '';
			$scope.month = '';
			$scope.day = '';
		});
	}

}])