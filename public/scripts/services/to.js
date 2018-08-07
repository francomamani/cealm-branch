app.factory('To', ["$location", function ($location) {
	return {
		login: function () {
			$location.path("/login");
		}
	};
}])