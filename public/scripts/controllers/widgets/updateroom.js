app.controller('UpdateRoomCtrl', ['$scope', 
	'$modalInstance',
	'Restangular',
	'title', 
	'room', function ($scope, $modalInstance, Restangular, title, room) {

	$scope.title = title;
	$scope.room = room;

	$scope.update = function () {
		Restangular.one('auth/rooms/'+$scope.room.id).put($scope.room).then(function (object) {
			console.log(object);
		});
		$modalInstance.close();
	}
	
}]);