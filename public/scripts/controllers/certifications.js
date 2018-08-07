app.controller('CertificationsCtrl', ['$scope',
 'Restangular',
 '$http',
 '$timeout',
 function ($scope, Restangular, $http, $timeout) {
	$scope.student = {};
	$scope.scores = [];
	$scope.pensum_records = [];
	$scope.pensum_record_json = {};
	/*
		1.academicfollow
	*/
	$scope.level = 0;
	$http.get('api/v1/auth/get_info_students').success(function (data) {
		$scope.students = data;
	});
	$scope.$watch('student', function () {
		$timeout(function () {
			$scope.pensum_records = Restangular.all('auth/pensum_records_by_student/'+$scope.student.originalObject.id).getList().$object;
		},300);
	});
	$scope.$watch('pensum_record', function () {
		$scope.pensum_record_json = JSON.parse($scope.pensum_record);
	});

	$scope.academicFollow = function () {
		$scope.level = 1;
		$scope.scores = Restangular.all('auth/academic_follow_by_pensum_record/'+$scope.pensum_record_json.id).getList().$object;
	}
	$scope.academicHistorial = function () {
		$scope.level = 2;
		$scope.scores = Restangular.all('auth/academic_historial_by_pensum_record/'+$scope.pensum_record_json.id).getList().$object;
	}	
	
	$scope.printAcademicFollow = function () {
		var columns = [
			{title: "Bimestre", key: "bimester"},
			{title: "Asignatura", key: "group"},
			{title: "Nota Final", key: "final_score"},
			{title: "Observaciones", key: "obs"}
		];
		var rows = $scope.scores;

		var doc = new jsPDF('p', 'pt', 'letter');
		doc.setFontSize(16);
		doc.setTextColor(9,62,163);
		doc.text(195, 30, "SEGUIMIENTO ACADÉMICO");
		doc.setFontSize(10);
		doc.text(130, 50, 'CENTRO DE ENSEÑANZA-APRENDIZAJE DE LENGUAS MODERNAS S.R.L.');
		doc.setFontSize(12);
		doc.text(40, 70, 'PROGRAMA: '+ angular.uppercase($scope.pensum_record_json.pensum_name));
		doc.text(40, 85, 'ESTUDIANTE: '+ angular.uppercase($scope.student.title));
		doc.autoTable(columns, rows);
		doc.save('seg_'+$scope.student.originalObject.username+'.pdf');
	}

	$scope.printAcademicHistorial = function () {
		var columns = [
			{title: "Bimestre", key: "bimester"},
			{title: "Asignatura", key: "group"},
			{title: "Nota Final", key: "final_score"},
			{title: "Observaciones", key: "obs"}
		];
		var rows = $scope.scores;

		var doc = new jsPDF('p', 'pt', 'letter');
		doc.setFontSize(16);
		doc.setTextColor(9,62,163);
		doc.text(195, 30, "HISTORIAL ACADÉMICO");
		doc.setFontSize(10);
		doc.text(130, 50, 'CENTRO DE ENSEÑANZA-APRENDIZAJE DE LENGUAS MODERNAS S.R.L.');
		doc.setFontSize(12);
		doc.text(40, 70, 'PROGRAMA: '+ angular.uppercase($scope.pensum_record_json.pensum_name));
		doc.text(40, 85, 'ESTUDIANTE: '+ angular.uppercase($scope.student.title));
		doc.autoTable(columns, rows);
		doc.save('his_'+$scope.student.originalObject.username+'.pdf');
	}		
}]);