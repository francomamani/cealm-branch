app.factory('Auth', ['$http', '$q', '$cookieStore', '$location', function ($http, $q, $cookieStore, $location) {
	return {
		load: function () {
			var deferred = $q.defer();
			$http.get('api/v1/auth').success(function (data) {
				deferred.resolve(data);
			}).error(function () {
				deferred.reject(data);
			});
			return deferred.promise;
		},
		logout: function () {
			return $http.get('api/v1/auth/logout');
		},
		login: function (inputs) {
			var deferred = $q.defer();
			$http.post('api/v1/auth/login', inputs).success(function (data) {
				deferred.resolve(data);
			}).error(function (data) {
				deferred.reject(data);
			});
			return deferred.promise;
		}, 
		register: function (inputs) {			
			var deferred = $q.defer();
			$http.post('api/v1/auth/register', inputs).success(function (data) {
				deferred.resolve(data);
			}).error(function (reason) {
				deferred.reject(reason);
			});
			return deferred.promise;
		}, 
		isLoggedIn: function () {
			var deferred = $q.defer();
			$http.get('api/v1/auth').success(function (data) {
				var value = false;
				if (data.hasOwnProperty('username')) {
					value = true;
				};
				deferred.resolve(value);
			}).error(function (reason) {
				deferred.reject(reason);
			});
			return deferred.promise;
		},
		showChangeRole: function () {
			var deferred = $q.defer();
			var response = "";
			$http.get('api/v1/auth').success(function (data) {
				var loggedIn = false;
				if (data.hasOwnProperty('username')) {
					loggedIn = true;
				};
				if (loggedIn == true) {
					if ($location.path() === "/roles") {
						response = false;
					}else{
						response = true;
					}
				}else{
					response = false;
				}
				deferred.resolve(response);
			}).error(function (reason) {
				deferred.reject(reason);
			});
			return deferred.promise;
		},
		isAdmin: function () {
			if(localStorage.getItem('role') == 1){
				return true;
			}else{
				return false;
			}
		}, 
		isAdministrative: function () {
			if(localStorage.getItem('role') == 2){
				return true;
			}else{
				return false;
			}
		},
		isTeacher: function () {
			if(localStorage.getItem('role') == 3){
				return true;
			}else{
				return false;
			}
		},
		isStudent: function () {
			if(localStorage.getItem('role') == 4){
				return true;
			}else{
				return false;
			}
		},
		isPublic: function () {
			if(localStorage.getItem('role') == null){ 
				return true;
			}else{
				return false;
			}
		},
		isControl: function () {
			if(localStorage.getItem('role') == 0){
				return true;
			}else{
				return false;
			}
		}
	};
}]);