app.controller('SubjectRecordCtrl', ['$scope','Restangular', 'Student', function ($scope, Restangular, Student) {
	$scope.students = [];
	$scope.selected = false;
	$scope.studentSelected = false;
	$scope.student = {};
	$scope.pensums = [];
	$scope.groups = [];
	$scope.group = {};
	$scope.pensum_record = {};
	$scope.bimester = {};
	$scope.complete_schedule = [];
	$scope.groupSelected = false;
	$scope.pensums = Restangular.all('auth/pensums').getList().$object;
	Restangular.one('auth/getcurrentbimester').get().then(function (data) {
		$scope.bimester = data;
	});
	$scope.searchStudent = function (search) {
		$scope.pensum_id = search.pensum_id;
		if (search.value == ''){
		}
		else{	
			$scope.studentSelected = false;
			Student.search(search).success(function (data) {
				if (data.length == 0) {
					toastr.error('No se encontraron coincidencias');
				}else{
					$scope.students = data;
					$scope.showSearch = true;
				}
			});
		};
		$scope.groups = Restangular.all('auth/current_groups_by_pensum/'+search.pensum_id).getList().$object;		
	}
	$scope.selectStudent = function (student) {
		$scope.showSearch = false;
		$scope.studentSelected = true;
		$scope.student = student;
		$scope.pensum_record = Restangular.one('auth/pensum_record_by_student_by_pensum/'+student.student_id+'/'+$scope.pensum_id).get().$object;
		toastr.success("Estudiante Seleccionado :D");
	}

	$scope.selectGroup = function (group) {
		$scope.group = group;
		$scope.groupSelected = true;
	}

	$scope.saveRecord = function () {
		var record = {
			bimester_id: $scope.bimester.id,
			pensum_record_id: $scope.pensum_record.id, 
			group_id: $scope.group.id, 
			student_id: $scope.student.student_id, 
			final_score: 0, 
			observations: "cursando"
		};
		console.log(record);
		Restangular.all('auth/records').post(record).then(function (data) {
			if (data.error) {
				toastr.error(data.error, 'Registro Duplicado')
			}else{
				toastr.success(data.success, 'Registro Exitoso!')
			}

		})
	}
}]);