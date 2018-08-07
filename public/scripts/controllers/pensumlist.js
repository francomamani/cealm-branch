app.controller('PensumListCtrl', [
	'$scope', 
	'Pensum', 
	'$q',
	'Restangular',
	function ($scope, Pensum, $q, Restangular) {
	$scope.pensums = [];
	$scope.pensum = {
		id: 1,
	};
	$scope.pensumSelected = {};
	$scope.subjects = [];
	var deferred = $q.defer();
	Pensum.index().success(function (data) {
		deferred.resolve(data);
	}).error(function (reason) {
		deferred.reject(reason);
	});
	deferred.promise.then(function (data) {
		$scope.pensums = data;
	});

	$scope.$watch('pensum.id', function () {
		$scope.subjects = Restangular.all('auth/get_subjects/'+$scope.pensum.id).getList().$object;
/*		Pensum.subjectsByPensum($scope.pensum).then(function (data) {
			$scope.subjects = data;
			console.log(data);
		});
		Pensum.show($scope.pensum).success(function (data) {
			$scope.pensumSelected = data;
		});*/
	});
/*	$scope.printPensum = function () {
			var columns = [
    			{title: "BIMESTRE", key: "bimester"}, 
    			{title: "CÓDIGO", key: "code"},
    			{title: "NOMBRE DE LA ASIGNATURA", key: "subject_name"},
			];

			var data = $scope.subjects;
			var doc = new jsPDF('p', 'pt', 'letter');
			doc.setFontSize(16);
			doc.setTextColor(9,62,163);
			doc.text(165, 30, angular.uppercase($scope.pensumSelected.name));
			doc.setFontSize(12);
			doc.text(180, 53, 'C/ PAGADOR N. 5635, COCHABAMBA Y CARO');
			doc.text(210, 68, 'INSTITUTO TÉCNICO CEALM. S.R.L.');
			doc.setFontSize(10);
			doc.text(130, 83, 'CENTRO DE ENSEÑANZA-APRENDIZAJE DE LENGUAS MODERNAS S.R.L.');
			doc.autoTable(columns, data, {});
			doc.save($scope.pensumSelected.name);		
	}*/
}]);