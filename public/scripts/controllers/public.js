app.controller('PublicCtrl', ['$scope', 
	'$http',
	'$sce',
	'Restangular',
	function ($scope, $http, $sce, Restangular) {
	$scope.search = {
		field: "title", 
		value: ""
	};
	
}]);