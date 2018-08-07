app.controller('RecordScheduleCtrl', ['$scope',
 '$modalInstance',
 'Restangular',
 'schedule_id',
 'day',
 'title',
 function ($scope, $modalInstance, Restangular, schedule_id, day, title) {
 	$scope.title = title;
 	Restangular.one('auth/getcurrentbimester').get().then(function (bimester) {
	 	$scope.groups = Restangular.all('auth/current_groups/'+bimester.id).getList().$object;
 	});
 	$scope.rooms = Restangular.all('auth/rooms').getList().$object;
	$scope.save = function (schedule_record) {
		schedule_record.schedule_id = schedule_id;
		schedule_record.day = day;
		console.log(schedule_record);
		Restangular.all('auth/schedule_records').post(schedule_record);
		$modalInstance.close();
	}
}]);