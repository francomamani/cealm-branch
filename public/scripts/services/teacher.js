app.factory('Teacher', ['$http', function ($http) {
	return {
		search: function (input) {
			return $http.post('api/v1/auth/search_teacher', input);
		}
	};
}]);