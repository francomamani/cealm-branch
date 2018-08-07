app.factory('Subject', ['$http', '$q', function ($http, $q) {
	return {
		index: function () {
			return $http.get('api/v1/auth/subjects');
		}, 
		show: function (input) {
			return $http.get('api/v1/auth/subjects/'+input.id);
		},
		store: function (input) {
			return $http.post('api/v1/auth/subjects', input);
		}, 
		allStore: function (inputs) {
			var deferred = $q.defer();
			var storeCalls = [];
			angular.forEach(inputs, function (input) {
				storeCalls.push($http.post('api/v1/auth/subjects', input));
			});
			$q.all(storeCalls)
				.then(
					function  (results) {
						deferred.resolve(results);
					}, 
					function (reasons) {
						deferred.reject(reasons);
					}, 
					function (updates) {
						deferred.update(updates);
					}
				);
			return deferred.promise;
		},
		update: function (input) {
			return $http.put('api/v1/auth/subjects/'+input.id, input);
		}, 
		delete: function (input) {
			return $http.delete('api/v1/auth/subjects/'+input.id);
		}
	};
}]);