app.factory('Bimester', ['$http', '$q', function ($http, $q) {
	return {
		setCurrentBimester: function (bimester) {
			var deferred  = $q.defer();
			$http.get('/api/v1/auth/setcurrentbimester/'+ bimester.id).success(function (data) {
				deferred.resolve(data);
			}).error(function (reason) {
				deferred.reject(reason);
			});
			return deferred.promise;
		}
	};
}]);