app.controller('ProductInfoCtrl', ['$scope', 
	'$modalInstance', 
	'title',
	'product',
	function ($scope, $modalInstance, title, product) {

	$scope.title = title;
	$scope.product = product;

	$scope.ok = function () {
		$modalInstance.close();
	}
/*	$scope.cancel = function () {
		$modalInstance.dismiss('cancel');
	}*/
}]);