app.controller('PayTuitionCtrl', ['$scope',
 'Restangular',
 'title',
 'pensum_record_id',
 '$modalInstance',
 function ($scope, Restangular, title, pensum_record_id, $modalInstance) {
	$scope.title = title;
	$scope.tuition = {
		pensum_record_id: pensum_record_id,
		price: 0.00
	};
	
	$scope.save = function (tuition) {
		Restangular.all('auth/tuitions').post(tuition).then(function (data) {
			$modalInstance.close(data);
		});
	}
}]);