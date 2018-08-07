app.controller('StudentSignupCtrl', ['$scope', 
	'Student', 
	'Calendar', 
	'Pensum',
	function ($scope, Student, Calendar, Pensum) {
	$scope.search = {
		value: ''
	};
	$scope.students = [];
	$scope.student = {};
	$scope.showSearch = false;
	$scope.studentSelected = false;
	/*calendar*/
	$scope.days = Calendar.days();
	$scope.months = Calendar.months();
	$scope.years = Calendar.years();
	$scope.pensum = {
		id: 1,
		bimester: 1,
	};
	$scope.pensums = [];
	$scope.subjects = [];
	$scope.subjectsByBimester = [];
	$scope.showOtherOccupation = false;
	Pensum.index().success(function (data) {
		$scope.pensums = data;
	});

	$scope.newstudent = {
		user_id: $scope.student.id,
		day: "1",
		month:"1", 
		year:"1990",
		gender: "Masculino",
		phone: "",
		occupation: "Escolar",
		other: "",
		contactperson: "",
		contactpersonphone: "",
		contactpersoncellphone: ""
	};
	$scope.$watch('pensum.id', function () {
		Pensum.bimestersByPensum({id: $scope.pensum.id}).then(function (data) {
			$scope.bimesters = data;
		});
	});
	$scope.$watch('pensum.bimester', function () {
		var parameters = {
			pensum_id: $scope.pensum.id,
			bimester: $scope.pensum.bimester
		};
		console.log(parameters);
		Pensum.subjectsByBimester(parameters).then(function (data) {
			console.log(data);
			$scope.subjectsByBimester = data;
		});
	});
	/*end calendar*/
	$scope.$watch('newstudent.occupation', function () {
		if ($scope.newstudent.occupation == "Otro"){
			$scope.showOtherOccupation = true;
		}
		else{
			if ($scope.showOtherOccupation == true) 
				$scope.showOtherOccupation = false;
		}
	});
	$scope.searchStudent = function () {
		if ($scope.search.value == ''){
			/*document.getElementById('value').focus();*/
		}
		else{	
			Student.search($scope.search).success(function (data) {
				if (data.error) {
					$scope.studentSelected = false;
					toastr.error('No se encontraron coincidencias :(');
					/*document.getElementById('value').focus();*/
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
		$scope.newstudent.user_id = student.id;
		toastr.success("Estudiante Seleccionado :D");
	}
	$scope.storeStudent = function (newstudent) {
		Student.store(newstudent).then(function (data) {
			if (data.error) {
				toastr.error(data.error);
			}else{
				toastr.success(data.success);
			}
		});
		$scope.showSearch = true;
		$scope.studentSelected = false;
		$scope.student = {};
		$scope.newstudent = {};
	}
}]);