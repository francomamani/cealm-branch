app.controller('UpdateBimesterCtrl', ['$scope',
 '$modalInstance',
 'title',
 'bimester',
 'Restangular',
 'Calendar',
 'year',
 '$http',
 function ($scope, $modalInstance, title, bimester, Restangular, Calendar, year, $http) {
 	$scope.title = title;
 	$scope.bimester = bimester;
 	$scope.year = year;
	$scope.update = function (bimester) {
//		var correct = Calendar.correctBimester(bimester.from, bimester.to);
//		if (correct.correct==true) {
			$http.put('api/v1/auth/bimesters/'+bimester.id, bimester).then(function (data) {
				if (data.data.success) {
					toastr.success(data.data.success);
				};
				console.log(data);
				$modalInstance.close();
			});
/*		}else{
			if (correct.sameMonth) {
				toastr.error(correct.sameMonth, "Error");				
			}else{
				toastr.error(correct.availableDays+" dias habiles registrados, pero se requiere al menos 40 dias.", "Bimestre Corto");
			}
		}*/

/*		Restangular.one('auth/bimesters/'+bimester.id).customPUT(bimester);
		$modalInstance.close();*/

	}	
	$scope.cancel = function () {
		$modalInstance.dismiss('cancel');
	}
}]);