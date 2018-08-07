app.controller('StatisticsCtrl', ['$scope', 'Calendar', 'Restangular', function ($scope, Calendar, Restangular) {
	$scope.years = Calendar.years();
	$scope.students = [];
	$scope.bimester = {};
	$scope.bimesters = Restangular.all('auth/bimesters').getList().$object;
	$scope.search = function (parameters) {
		console.log($scope.bimester);
		parameters.bimester_id = $scope.bimester.originalObject.id;
		Restangular.all('auth/statistics').post(parameters).then(function (data) {
			$scope.students = data;
			console.log(data);
		});
	}
}]);