app.controller('PensumCtrl', ['$scope', 
	'Calendar', 
	'Pensum', 
	'Restangular',
	function ($scope, Calendar, Pensum, Restangular) {
	$scope.pensums = Restangular.all('auth/pensums').getList().$object;
	$scope.languages = Restangular.all('auth/languages').getList().$object;

	$scope.years = Calendar.pensumyears();
	$scope.pensum = {
		year: new Date().getFullYear(), 
		name: ""
	};
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

	$scope.getPensums = function  () {
		$scope.pensums = Restangular.all('auth/pensums').getList().$object;
	}

	$scope.getPensum = function (id) {
		Pensum.show({id: id}).success(function (data) {
			Restangular.one('auth/languages/'+data.language_id).get().then(function (language) {
				$scope.structure.language = language.spanish_name;
				$scope.structure.acronym = language.acronym;
				console.log(language);
			}); 
		});
	}

	$scope.store = function (pensum) {
		Pensum.store(pensum).success(function (data) {
			toastr.success(data.success);
		});
/*		document.getElementById("year").focus();*/
		$scope.getPensums();
	}

	$scope.$watch('pensum.year', function () {
		$scope.pensum.name = "PENSUM ACADÉMICO "; 
	});
/*
	$scope.$watch('pensum.language_id', function () {
		$scope.pensum.name = "PENSUM ACADÉMICO " + language.name + " "+ $scope.pensum.year; 
	});
*/


/*start*/
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
	$scope.render = function () {
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
				toastr.success("La generacion de asignaturas fue exitosa", "GENERADO");
			}else{
				toastr.error("Las asignaturas del pensum ya fueron generadas.", "ERROR!");
			}
			/*endif*/
		});		
		
	}
/*end*/

}]);