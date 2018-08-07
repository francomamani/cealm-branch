app.controller('AddCategoryMarkCtrl', ['$scope',
 'Restangular',
 '$modalInstance',
 'title',
 'exam_type',
 'group',
 function ($scope, Restangular, $modalInstance, title, exam_type, group) {
 	$scope.title = title;
 	$scope.category_mark = {
 		exam_type_id: exam_type.id, 
 		description: "",
 		percentage: 0,
 		acronym: ""
 	};
	$scope.categories =	Restangular.all('auth/categories_by_group/'+group.id).getList().$object;

	$scope.save = function (category_mark) {
		category_mark.acronym  = category_mark.description.substring(0, 1); 
		Restangular.all('auth/category_marks').post(category_mark).then(function (data) {
			$modalInstance.close(data);
		});
	}
}]);