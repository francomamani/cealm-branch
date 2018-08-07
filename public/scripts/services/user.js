app.factory('User', ["$http", "$location", '$q', function ($http, $location, $q) {
	return {
		load: function () {
			return $http.get('/api/v1/auth');
		},
		all: function () {
			return $http.get('api/v1/auth/users');
		},
		getPage: function (new_page) {
			return $http.get('/api/v1/auth/users?page='+new_page);
		},
		update: function (user) {
			return $http.put('api/v1/auth/users/'+user.id, user);			
		},
		updatePassword: function (user) {
			return $http.put('api/v1/auth/update_password', user);			
		},
		updateRole: function (user) {
			return $http.put('api/v1/auth/update_role', user);			
		},
		delete: function (id) {
			$http.delete('api/v1/auth/users/'+id);
			return this.all(); 
		}, 
		search: function (input) {
			var deferred = $q.defer();
			$http.post('api/v1/auth/search_users', input).success(function (data) {
				deferred.resolve(data);
			}).error(function (reason) {
				deferred.reject(reason);
			});
			return deferred.promise;
		}
	};
}]);