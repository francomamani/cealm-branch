app.controller('AssignSchedulesCtrl', [
	'$scope',
	'Restangular',
	'Calendar',
	'$modal',
	'$log',
	function ($scope, Restangular, Calendar, $modal, $log) {

	Restangular.one('auth/getcurrentbimester').get().then(function (bimester) {
		$scope.bimester = bimester;
		//$scope.groups = Restangular.all('auth/current_groups/'+bimester.id).getList().$object;
//		$scope.schedules = Restangular.all('auth/current_schedules/'+bimester.id).getList().$object;
		$scope.complete_schedule  = Restangular.all('auth/complete_schedule/'+bimester.id).getList().$object; 
	});

	$scope.getCompleteSchedule = function () {
		$scope.complete_schedule  = Restangular.all('auth/complete_schedule/'+$scope.bimester.id).getList().$object; 
	}

	$scope.hours = Calendar.hours();
	$scope.schedule={
		from: "",
		to: "",
		bimester_id: ""
	};

	$scope.assignSchedule = function (schedule) {
		schedule.bimester_id = $scope.bimester.id;
		Restangular.all('auth/schedules').post(schedule).then(function (data) {
			if (data.success) {
				toastr.success(data.success);
			}else{				
				toastr.error('No se pudo guardar el horario');
			}
		});
		$scope.getCompleteSchedule();
	}
	$scope.recordSchedule = function (schedule_id, day) {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/recordschedule.html', 
			controller: 'RecordScheduleCtrl', 
			size: 'md', 
			resolve: {
				title: function () {
					return "Registrar curso en horario"; 
				},
				schedule_id: function () {
					return schedule_id;
				},
				day: function () {
					return day;
				}
			}
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function () {
			toastr.success('Grupo registrado en el horario');
			$scope.getCompleteSchedule();
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});
/*		Restangular.all('auth/schedule_records').post(schedule_record).then(function (data) {
			if (data.success) {
				toastr.success(data.success);
			}else{				
				toastr.error('No se pudo registrar el horario');
			}
		});*/
	}

/*	$scope.rooms = Restangular.all('auth/rooms').getList().$object;
	$scope.days = Calendar.literalDays();
	$scope.assignSchedule = function (schedule) {
		Restangular.all('auth/schedules').post(schedule).then(function (data) {
			if (data.success) {
				toastr.success(data.success);
			}else{				
				toastr.error('No se pudo guardar el horario');
			}
		});
	}*/

}]);