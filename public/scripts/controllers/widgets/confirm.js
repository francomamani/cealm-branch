app.controller('ConfirmCtrl', ['$scope', 
	'$modalInstance',  
	'title', 
	'message', function ($scope, $modalInstance, title, message) {

	$scope.title = title;
	$scope.message = message;
	$scope.ok = function () {
		$modalInstance.close();
	}
	$scope.cancel = function () {
		$modalInstance.dismiss('cancel');
	}
}]);