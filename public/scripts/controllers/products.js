app.controller('ProductsCtrl', ['$scope', 
	'Product', 
	'$modal', 
	function ($scope, Product, $modal) {
	$scope.products = [];
	Product.all().success(function (data) {
		$scope.products = data;
	});
	$scope.changePage = function (new_page) {
		Product.getPage(new_page).success(function (data) {
			$scope.products = data;
		});
	}
	$scope.more = function (size, product) {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/productInfo.html', 
			controller: 'ProductInfoCtrl', 
			size: size, 
			resolve: {
				title: function () {
					return "Información de Producto"; 
				},
				product: function () {
					return product;
				} 
			}
		};
		var productInfoInstance = $modal.open(settings);
		productInfoInstance.result.then(function () {
		}, function () {
			$log.info("Información de producto cancelada a las: "+ new Date());
		});

	}
}]);