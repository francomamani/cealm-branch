app.factory('Pensum', ['$http', '$q',  function ($http, $q) {
	return {
		index: function () {
			return $http.get('api/v1/auth/pensums');
		}, 
		show: function (input) {
			return $http.get('api/v1/auth/pensums/'+input.id);
		},
		store: function (input) {
			return $http.post('api/v1/auth/pensums', input);
		}, 
		update: function (input) {
			return $http.put('api/v1/auth/pensums/'+input.id, input);
		}, 
		delete: function (input) {
			return $http.delete('api/v1/auth/pensums/'+input.id);
		}, 
		bimestersByPensum: function (input) {			
			var deferred = $q.defer();
			$http.get('api/v1/auth/bimesters_by_pensum/'+input.id).success(function (data) {
				deferred.resolve(data);
			}).error(function (reason) {
				deferred.reject(reason);
			});
			return deferred.promise;
		},
		subjectsByPensum: function (input) {			
			var deferred = $q.defer();
			$http.get('api/v1/auth/subjects_by_pensum/'+input.id).success(function (data) {
				deferred.resolve(data);
			}).error(function (reason) {
				deferred.reject(reason);
			});
			return deferred.promise;
		},		
		subjectsByBimester: function (input) {
			var deferred = $q.defer();
			$http.get('api/v1/auth/subjects_by_bimester/'+input.pensum_id+"/"+input.bimester).success(function (data) {
				deferred.resolve(data);
			}).error(function (reason) {
				deferred.reject(reason);
			});
			return deferred.promise;
		}
	};
}]);