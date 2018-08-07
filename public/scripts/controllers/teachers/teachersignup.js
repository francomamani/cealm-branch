app.controller('TeacherSignupCtrl', ['$scope',
	'Teacher', 
	function ($scope, Teacher) {

	$scope.search = {
		value: ""
	};
	$scope.teachers = [];
	$scope.teacher = {};
	$scope.showSearch = false;
	$scope.teacherSelected = false;
	$scope.searchTeacher = function () {
		if ($scope.search.value == "") {
			document.getElementById("value").focus();
		}else{	
			Teacher.search($scope.search).success(function (data) {
				$scope.teachers = data;
				if (data.error) {
					toastr.error('No se encontraron coincidencias :(');
					$scope.showSearch = false;
					$scope.teacherSelected = false;
					document.getElementById("value").focus();
				}
				else{
					$scope.showSearch = true;
				}

			});
		}
	}
	$scope.selectTeacher = function (t) {
		$scope.teacher = t;
		$scope.showSearch = false;
		$scope.teacherSelected = true;
		toastr.success('Profesor seleccionado :D');
	}
}])