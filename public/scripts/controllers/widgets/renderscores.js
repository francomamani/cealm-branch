app.controller('RenderScoresCtrl', ['$scope',
 '$http',
 'Restangular',
 '$modalInstance',
 function ($scope, $http, Restangular, $modalInstance) {
 	$scope.bimester = {};
	$scope.bimesters = Restangular.all('auth/bimesters').getList().$object;
	$scope.group_id = "";	
	$scope.$watch('bimester.originalObject.id', function () {
		$scope.groups = Restangular.all('auth/groups_by_bimester_standard/'+$scope.bimester.originalObject.id).getList().$object;
	});

	$scope.send = function () {
		$http.get('api/v1/auth/render_structure/'+$scope.group_id).success(function (data) {
			$modalInstance.close(data);
		});
	}

}]);