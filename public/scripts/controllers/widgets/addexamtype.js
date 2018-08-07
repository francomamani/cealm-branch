app.controller('AddExamTypeCtrl', ['$scope', 
	'Restangular', 
	'$modalInstance', 
	'title',
	'group',
	'exam_types',
	'counter',
	function ($scope, Restangular, $modalInstance, title, group, exam_types, counter) {
	$scope.counter = counter;
	$scope.title = title;
	$scope.exam_type ={
		group_id: group.id, 
		description: "",
		percentage: 0,
		acronym : ""
	}
	$scope.exam_types = exam_types;
	$scope.exams = [
			"REGULAR EXAMS", 
			"KET EXAMS", 
			"PET EXAMS", 
			"FCE EXAMS", 
			"CAE EXAMS", 
			"CPE EXAMS", 
			"IELTS EXAMS", 
	];	
	$scope.save = function (exam_type) {
		if ($scope.counter + exam_type.percentage <=100 ) {
			if (exam_type.percentage > 0) {
				toastr.success('Examen registrado exitosamente');
				exam_type.acronym = exam_type.description.substring(0,1);
				Restangular.all('auth/exam_types').post(exam_type).then(function (data) {
					$modalInstance.close(data);
				});				
			}else{
				toastr.error('El porcentaje no puede ser 0');
			}
		}else{
			toastr.error('Por favor recalcule el porcentaje');
		}
	}
}]);