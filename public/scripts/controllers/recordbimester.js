app.controller('RecordBimesterCtrl', ['$scope',  
	'Calendar',  
	'Restangular',  
	'Bimester',  	
	'$modal',
	function ($scope, Calendar, Restangular, Bimester, $modal) {
	$scope.years = Calendar.years();
	$scope.yearsModel = Restangular.all('auth/years').getList().$object;
	$scope.year = {};
	$scope.showYear = true;
	$scope.currentBimester = Restangular.one('auth/getcurrentbimester').get().$object;
	$scope.bimester = {
		num_bimester: '', 
		year_id: '',
		progress: false,
		from: '',
		to: ''
	}
	$scope.bimesters = [];
	$scope.$watch('bimester.num_bimester', function () {
		$scope.bimester.num_bimester = angular.uppercase($scope.bimester.num_bimester); 
	});

	$scope.getBimesters = function () {
		$scope.bimesters = Restangular.all('auth/bimesters').getList().$object;
	}	
	$scope.recordBimester = function (year) {
		$scope.showYear = false;
		$scope.year = year;
		$scope.bimesters = Restangular.all('auth/bimesters_by_year/'+year.id).getList().$object;
	}
	$scope.store = function (bimester) {
		bimester.year_id = $scope.year.id;
		//var correct = Calendar.correctBimester(bimester.from, bimester.to);
		//if (correct.correct==true) {
			Restangular.all('auth/bimesters').post(bimester).then(function(data) {
				if (data.error) {
					toastr.error(data.error);
				}else{
					$scope.bimesters.unshift(data);
					toastr.success('Bimestre registrado');
					$scope.bimester = {
						num_bimester: '', 
						year_id: '',
						progress: false,
						from: '',
						to: ''
					};
				}
			});
		/*}else{
			if (correct.sameMonth) {
				toastr.error(correct.sameMonth, "Error");				
			}else{
				toastr.error(correct.availableDays+" días hábiles registrados, pero se requieren 40 días.", "Bimestre Corto");
			}
		}*/

	}
	$scope.getCurrentBimester = function () {
		$scope.currentBimester = Restangular.one('auth/getcurrentbimester').get().$object;
	}
	$scope.setCurrentBimester = function (bimester) {
		Bimester.setCurrentBimester(bimester).then(function (data) {
			toastr.success(data.success);
		});
		$scope.getCurrentBimester();
	}

	$scope.updateBimester = function (bimester) {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/updateBimester.html', 
			controller: 'UpdateBimesterCtrl', 
			size: 'md', 
			resolve: {
				title: function () {
					return "Actualizar Bimestre"; 
				},
				bimester: function () {
					return bimester;
				},
				year: function () {
					return $scope.year.name;
				}
			}
		};
		var confirmInstance = $modal.open(settings);
/*		confirmInstance.result.then(function () {
			$scope.deleteUser(user);
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});*/
	}

	$scope.recordYear = function () {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/recordyear.html', 
			controller: 'RecordYearCtrl', 
			size: 'md', 
			resolve: {
				title: function () {
					return "Registrar nuevo año"; 
				}
			}
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function (data) {
			$scope.yearsModel.unshift(data);
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});
	}
	$scope.updateYear = function (year) {
		year.put().then(function () {
			year.update = false;
		});
	}
}]);