app.controller('CareerRegistrationCtrl', ['$scope', 
	'Student', 
	'Restangular', 
	function ($scope, Student, Restangular) {
	$scope.students = [];
	$scope.selected = false;
	$scope.studentSelected = false;
	$scope.student = {};
	$scope.pensums = Restangular.all('auth/pensums').getList().$object;

	$scope.searchStudent = function (search) {
		if (search.value == ''){
		}
		else{	
			$scope.studentSelected = false;
			Student.searchGlobal(search).success(function (data) {
				if (data.error) {
					$scope.studentSelected = false;
					toastr.error('No se encontraron coincidencias :(');
				}else{	
					$scope.students = data;
					$scope.showSearch = true;
				}
			});
		};
	}
	$scope.selectStudent = function (student) {
		$scope.showSearch = false;
		$scope.studentSelected = true;
		$scope.student = student;
		toastr.success("Estudiante Seleccionado :D");
	}
	$scope.recordPensum = function (pensum_record) {
		pensum_record.student_id = $scope.student.id;
		pensum_record.status = "nuevo";
		Restangular.all('auth/pensum_records').post(pensum_record).then(function (data) {
			if (data.success) {
				toastr.success(data.success, 'EXITO');
			}else{				
				toastr.error(data.error, 'ESTUDIANTE PREVIAMENTE REGISTRADO');
			}
		});
	}
}]);