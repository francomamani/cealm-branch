app.factory('Plan', ['$http', function ($http) {
	return {
		all: function (data) {
			return $http.get('api/v1/auth/planes');
		}, 
		myPlans: function () {
			return $http.get('api/v1/auth/my_plans');			
		}, 
		allPlans: function () {
			return $http.get('api/v1/auth/all_plans');			
		}
	};
}]);