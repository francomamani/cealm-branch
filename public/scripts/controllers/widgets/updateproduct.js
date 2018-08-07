app.controller('UpdateProductCtrl', ['$scope', 
	'$modalInstance', 
	'$http', 
	'title', 
	'product',
	'Product', function ($scope, $modalInstance, $http, title, product, Product) {
	
	$scope.title = title;
	$scope.product = product;
	$scope.data = {
		"message" : ""
	};
	$scope.updateProduct = function (product) {
		Product.update(product).success(function () {
			$scope.data.message = "Producto Actualizado";
			$modalInstance.close($scope.data);
		});
	}
	
}]);