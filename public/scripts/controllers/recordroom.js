app.controller('RecordRoomCtrl', ['$scope',
	'$modal', 
	'Restangular', function ($scope, $modal, Restangular) {
	$scope.room = {
		name: "", 
		capacity: ""
	}
	$scope.$watch('room.name', function () {
		$scope.room.name = angular.uppercase($scope.room.name); 
	});

	$scope.rooms = Restangular.all('auth/rooms').getList().$object;

	$scope.getRooms = function () {
		$scope.rooms = Restangular.all('auth/rooms').getList().$object;	
	}
	$scope.store = function (room) {
		Restangular.all('auth/rooms').post(room).then(function (data) {
			toastr.success(data.success);
		});
		$scope.room = {};
		$scope.getRooms();
	}	
	$scope.update = function (room) {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/room.html', 
			controller: 'UpdateRoomCtrl', 
			size: 'md', 
			resolve: {
				title: function () {
					return "Actualizar Información de Aula"; 
				},
				room: function () {
					return room;
				} 
			}
		};
		var updateInstance = $modal.open(settings);
		updateInstance.result.then(function () {
			toastr.success('Información de Aula Actualizada');
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});
	}
	$scope.delete = function (room) {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/confirm.html', 
			controller: 'ConfirmCtrl', 
			size: 'md', 
			resolve: {
				title: function () {
					return "Confirmar"; 
				},
				message: function () {
					return "Esta seguro de eliminar el :"+room.name+"?"
				} 
			}
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function () {
			Restangular.one('auth/rooms/'+room.id).remove().then(function (data) {
				toastr.success(data.success);
			});
			$scope.getRooms();
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});

	}

}]);