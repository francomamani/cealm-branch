app.controller('UpdatePriceCtrl', ['$scope',
 '$modalInstance',
 'title',
 'price',
 function ($scope, $modalInstance, title, price) {
	$scope.price = price;
	$scope.title = title;

	$scope.$watch('price.description', function () {
		$scope.price.description = angular.uppercase(price.description);
	});
	$scope.update = function (price) {
		price.put();
		$modalInstance.close();
	}
}]);