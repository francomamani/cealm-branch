app.controller('AddScoreCtrl', ['$scope',
 'title',
 'group', 
 'Restangular',
 '$http',
 '$modalInstance',
 function ($scope, title, group, Restangular, $http, $modalInstance) {
 	$scope.group = group;
	$scope.title = title;
	$scope.informationMark = {
		group_id: $scope.group.id,
		exam_type_id: "",
		category_mark_id: "", 
		title: "", 
		description: "", 
		start_date: "", 
		end_date: "" 		
	};
	console.log($scope.informationMark);
	$scope.categoryMarks = {};
	$http.get('api/v1/auth/exam_types_by_group/'+$scope.group.id).then(function (data) {
		$scope.exam_types = data.data;
	});
	$scope.$watch("informationMark.exam_type_id", function () {
		$http.get("api/v1/auth/category_marks_by_exam_type/"+$scope.informationMark.exam_type_id).then(function (data) {
			$scope.categoryMarks = data.data;
			console.log(data);
		});
	});
	$scope.save = function () {
		var informationMark = {};
		Restangular.all("auth/information_marks").post($scope.informationMark).then(function (data) {
			informationMark = data;
			$modalInstance.close(informationMark);
		});
	}

}]);