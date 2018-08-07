app.controller('PensumStructureCtrl', ['$scope', 
	'Pensum', 
	'Subject',
	'$q',
	'Restangular', 
	function ($scope, Pensum, Subject, $q, Restangular) {
	$scope.structure = {
		pensum_id: 0,
		acronym: "", 
		language: "",
		bimester: "1", 
		level: "A", 
		month: "1", 
		code: "", 
		bimester_quantity: 18
	};
	$scope.pensums = [];
	$scope.subjects = []; 
	Pensum.index().success(function (data) {
		$scope.pensums =  data;
	});
	
	
	$scope.getPensum = function (id) {
		$scope.subjects = Restangular.all('auth/get_subjects/'+$scope.structure.pensum_id).getList().$object;
		Pensum.show({id: id}).success(function (data) {
			$scope.structure.acronym = data.acronym;
			$scope.structure.language = data.language;
		});
	}
	$scope.renderCode = function () {
		$scope.structure.code = $scope.structure.acronym + " " +
								$scope.structure.bimester+ " " +
								$scope.structure.level + "1 " + 
								$scope.structure.month;
		$scope.structure.level = angular.uppercase($scope.structure.level);
	}
	$scope.$watch('structure.acronym', $scope.renderCode);
	$scope.$watch('structure.bimester', $scope.renderCode);
	$scope.$watch('structure.level', $scope.renderCode);
	$scope.$watch('structure.month', $scope.renderCode);

	$scope.currentMonth =  function (month, count) {
		switch(count){
			case 1: return 'I'; break; 
			case 2: return 'II'; break; 
			case 3: return 'III'; break; 
			case 4: return 'IV'; break; 
			case 5: return 'V'; break; 
			case 6: return 'VI'; break; 
			case 7: return 'VII'; break; 
			case 8: return 'VIII'; break; 
			case 9: return 'IX'; break; 
			case 10: return 'X'; break; 
		}
	}
	$scope.nextLevel = function (level) {
		switch(level){
			case 'A': return 'B'; break; 
			case 'B': return 'C'; break; 
		}
	}
	$scope.renderStructure = function () {
		Restangular.one('auth/pensums/'+$scope.structure.pensum_id).get().then(function (data) {
			if (data.empty == true) 
			{
				var level = "A";
				var count = 0;
				$scope.subjects = [];
				for (var i = 1; i <= $scope.structure.bimester_quantity; i++) {
					if (i <= 2) {
						var subject = {
							pensum_id: $scope.structure.pensum_id,
							bimester: i	, 
							subject_code: $scope.structure.acronym + " " + i,
							subject_name: $scope.structure.language + " Bimestre "+ i,					
						}; 
						
						Restangular.all('auth/subjects').post(subject).then(function (data) {					
							for( j = 1; j<=2; j++){
								level = "A";
								count++;
								Restangular.all('auth/levels').post({
									subject_id: data.id, 
									level_code: level+"1 " + $scope.currentMonth($scope.structure.month, count),
									level_name: $scope.structure.language + " Básico " +$scope.currentMonth($scope.structure.month, count)
								}); 
								if (count%4 == 0) count = 0;
							}/*end for*/					
						});

					};

					//elemental
					if (i >= 3  && i <= 4) {
						var subject = {
							pensum_id: $scope.structure.pensum_id,
							bimester: i	, 
							subject_code: $scope.structure.acronym + " " + i,
							subject_name: $scope.structure.language + " Bimestre "+ i,					
						};
						Restangular.all('auth/subjects').post(subject).then(function (data) {
							
							for( j = 1; j<=2; j++){
								count++;
								Restangular.all('auth/levels').post({
									subject_id: data.id, 
									level_code: level+"2 " + $scope.currentMonth($scope.structure.month, count),
									level_name: $scope.structure.language + " Elemental " +$scope.currentMonth($scope.structure.month, count),
								});
								if (count%4 == 0) count = 0;
							}/*end for*/					
						});
					};

					//Pre-Intermedio
					if (i >= 5  && i <= 6) {
		/*				if (i == 5){
							level = $scope.nextLevel(level);
							level = "B";
						} */
						var subject = {
							pensum_id: $scope.structure.pensum_id,
							bimester: i	, 
							subject_code: $scope.structure.acronym + " " + i,
							subject_name: $scope.structure.language + " Bimestre "+ i,					
						};
						Restangular.all('auth/subjects').post(subject).then(function (data) {
							level = "B";	
							for( j = 1; j<=2; j++){
								count++;
								Restangular.all('auth/levels').post({
									subject_id: data.id, 
									level_code: level+"1 " + $scope.currentMonth($scope.structure.month, count),
									level_name: $scope.structure.language + " Pre-Intermedio " +$scope.currentMonth($scope.structure.month, count)
								});
								if (count%4 == 0) count = 0;
							}/*end for*/					
						});
					};
					//Intermedio
					if (i >= 7  && i <= 10) {
						var subject = {
							pensum_id: $scope.structure.pensum_id,
							bimester: i	, 
							subject_code: $scope.structure.acronym + " " + i,
							subject_name: $scope.structure.language + " Bimestre "+ i,					
						};
						Restangular.all('auth/subjects').post(subject).then(function (data) {
							
							for( j = 1; j<=2; j++){
								count++;
								Restangular.all('auth/levels').post({
									subject_id: data.id, 
									level_code: level+"2 " + $scope.currentMonth($scope.structure.month, count),
									level_name: $scope.structure.language + " Intermedio " +$scope.currentMonth($scope.structure.month, count)
								});
								if (count%8 == 0) count = 0;
							}/*end for*/					
						});
					};
					//Intermedio Alto
					if (i >= 11  && i <= 14) {
		/*				if (i == 11){
							level = $scope.nextLevel(level);
							level = "C";
						} 
		*/				var subject = {
							pensum_id: $scope.structure.pensum_id,
							bimester: i	, 
							subject_code: $scope.structure.acronym + " " + i,
							subject_name: $scope.structure.language + " Bimestre "+ i,					
						};
						Restangular.all('auth/subjects').post(subject).then(function (data) {
							level ="C";
							for( j = 1; j<=2; j++){
								count++;
								Restangular.all('auth/levels').post({
									subject_id: data.id, 
									level_code: level+"1 " + $scope.currentMonth($scope.structure.month, count),
									level_name: $scope.structure.language + " Intermedio Alto " +$scope.currentMonth($scope.structure.month, count)
								});
								if (count%8 == 0) count = 0;
							}/*end for*/					
						});
					};
					//Avanzado
					if (i >= 15  && i <= 16) {
						var subject = {
							pensum_id: $scope.structure.pensum_id,
							bimester: i	, 
							subject_code: $scope.structure.acronym + " " + i,
							subject_name: $scope.structure.language + " Bimestre "+ i,					
						};
						Restangular.all('auth/subjects').post(subject).then(function (data) {
							
							for( j = 1; j<=2; j++){
								count++;
								Restangular.all('auth/levels').post({
									subject_id: data.id, 
									level_code: level+"2 " + $scope.currentMonth($scope.structure.month, count),
									level_name: $scope.structure.language + " Avanzado " +$scope.currentMonth($scope.structure.month, count)
								});
								if (count%4 == 0) count = 0;
							}/*end for*/					
						});
					};
					//Super Avanzado
					if (i >= 17  && i <= 18) {
						var subject = {
							pensum_id: $scope.structure.pensum_id,
							bimester: i	, 
							subject_code: $scope.structure.acronym + " " + i,
							subject_name: $scope.structure.language + " Bimestre "+ i,					
						};
						Restangular.all('auth/subjects').post(subject).then(function (data) {
							
							for( j = 1; j<=2; j++){
								count++;
								Restangular.all('auth/levels').post({
									subject_id: data.id, 
									level_code: level+"2 " + $scope.currentMonth($scope.structure.month, count),
									level_name: $scope.structure.language + " Super Avanzado " +$scope.currentMonth($scope.structure.month, count)
								});
								if (count%4 == 0) count = 0;
							}/*end for*/					
						});
					};
				};

				Restangular.one('auth/pensums/'+$scope.structure.pensum_id).get().then(function (pensum) {
					pensum.empty = false;
					Restangular.one('auth/pensums/'+pensum.id).customPUT(pensum);
				});
			}else{
				toastr.error("Las asignaturas del pensum ya fueron generadas.", "Error!");
			}
			/*endif*/
		});		
		
	}

}]);

