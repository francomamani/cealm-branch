app.factory('Student', ['$http', '$q', function ($http, $q) {
	return {
		search: function (input) {
			return $http.post('api/v1/auth/search_students', input);
		}, 
		searchGlobal: function (input) {
			return $http.post('api/v1/auth/search_students_global', input);
		}, 
		all: function () {
			var deferred = $q.defer();
			$http.get('api/v1/auth/students').success(function (data) {
				deferred.resolve(data);
			}).error(function (reason) {
				deferred.reject(reason);
			});
			return deferred.promise;
		},
		show: function (input) {
			var deferred = $q.defer();
			$http.get('api/v1/auth/students/'+input.id).success(function (data) {
				deferred.resolve(data);
			}).error(function (reason) {
				deferred.reject(reason);
			});
			return deferred.promise;
		},
		store: function (input) {
			var deferred = $q.defer();
			$http.post('api/v1/auth/students', input).success(function (data) {
				deferred.resolve(data);
			}).error(function (reason) {
				deferred.reject(reason);
			});
			return deferred.promise;
		},
		update: function (input) {
			var deferred = $q.defer();
			$http.put('api/v1/auth/students/'+input.id, input).success(function (data) {
				deferred.resolve(data);
			}).error(function (reason) {
				deferred.reject(reason);
			});
			return deferred.promise;
		},
		delete: function (input) {
			var deferred = $q.defer();
			$http.delete('api/v1/auth/students/'+input.id).success(function (data) {
				deferred.resolve(data);
			}).error(function (reason) {
				deferred.reject(reason);
			});
			return deferred.promise;
		}
	};
}]);