app.controller('StudentCtrl', ['$scope',
 '$cookieStore',
 'Restangular',
 '$http',
 function ($scope, $cookieStore, Restangular, $http) {
	/*
		levels
		1. my registered careers(pensums)
		2. my current group
		3. my classmates 
		4. my highpraise scores
		5. my detailed scores
		6. academic follow
		7. academic historial
	*/
	$scope.level = 1;
	$scope.user = JSON.parse(localStorage.getItem('user'));
	$scope.pensums  = Restangular.all('auth/pensums_by_user/'+$scope.user.id).getList().$object;
	$scope.group = {};
	$scope.scores = [];
	$scope.showGroup = function (pensum) {
		$scope.level = 2;
/*		console.log('pensum record: '+ pensum.pensum_record_id);
		console.log('user: '+ $scope.user.id);*/
		$scope.group = Restangular.one('auth/groups_by_pensum_record_by_user/'+pensum.pensum_record_id+'/'+ $scope.user.id).get().$object;
	}
	$scope.academicFollow = function (pensum) {
		$scope.level = 6;
		$scope.pensum = pensum;
		$http.get('api/v1/auth/academic_follow_by_pensum_record/'+pensum.pensum_record_id).success(function (data) {
			$scope.scores = data;
		});
	}
	$scope.academicHistorial = function (pensum) {
		$scope.level = 7;
		$scope.pensum = pensum;
		$http.get('api/v1/auth/academic_historial_by_pensum_record/'+pensum.pensum_record_id).success(function (data) {
			$scope.scores = data;
		});
	}

	$scope.myClassmates = function(group) {
		$scope.level = 3;

		$scope.students = Restangular.all('auth/students_by_group/'+group.id).getList().$object;  
	}
	$scope.myScores = function (group) {
		$scope.level = 4;
		Restangular.one('auth/record_by_group_by_user/'+group.id+'/'+$scope.user.id).get().then(function (record) {
//			$scope.scores = Restangular.all('auth/scores_by_record/'+record.id).getList().$object;
			Restangular.all('auth/scores_by_record/'+record.id).getList().then(function (scores) {
				var final_score = 0;
				angular.forEach(scores, function (score) {
					final_score += parseFloat(score.nota); 
				})
				scores.final_score = final_score;
				$scope.scores = scores;

			});

		});
	}
	$scope.myDetailedScores = function (group) {
		$scope.level = 5;
		Restangular.one('auth/record_by_group_by_user/'+group.id+'/'+$scope.user.id).get().then(function (record) {
			$scope.scores = Restangular.all('auth/detailed_scores_by_record/'+record.id).getList().$object;
		});
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
		doc.text(40, 70, 'PROGRAMA: '+ angular.uppercase($scope.pensum.name));
		doc.text(40, 85, 'ESTUDIANTE: '+ angular.uppercase($scope.user.lastname + " " + $scope.user.firstname));
		doc.autoTable(columns, rows);
		doc.save('seg_'+$scope.user.username+'.pdf');
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
		doc.text(40, 70, 'PROGRAMA: '+ angular.uppercase($scope.pensum.name));
		doc.text(40, 85, 'ESTUDIANTE: '+ angular.uppercase($scope.user.lastname + " " + $scope.user.firstname));
		doc.autoTable(columns, rows);
		doc.save('his_'+$scope.user.username+'.pdf');
	}			
}]);