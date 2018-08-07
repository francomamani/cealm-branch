app.controller('RecepcionPlanesCtrl', ['$scope', 
	'Plan', function ($scope, Plan) {

	Plan.allPlans().success(function (data) {
		$scope.plans = data;
	});

}]);