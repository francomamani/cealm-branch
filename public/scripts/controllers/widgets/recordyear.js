app.controller('RecordYearCtrl', ['$scope',
 'Calendar',
 '$modalInstance',
 'Restangular',
 'title',
 function ($scope, Calendar, $modalInstance, Restangular, title) {
 	$scope.title = title;
	$scope.years = Calendar.years();
	$scope.save = function(year) {
		Restangular.all('auth/years').post(year).then(function (data) {
			if (data.error) {
				toastr.error(data.error);
			}else{
				$modalInstance.close(data);
			}
		});
	};	
}]);