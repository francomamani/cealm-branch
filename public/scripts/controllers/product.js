app.controller('ProductCtrl', ['$scope', 
	'Product', 
	'$modal', 
	'$log', 
	function ($scope, Product, $modal, $log) {
		
	$scope.show = true;
	$scope.products = [];
	$scope.product = {};
	$scope.value = "";
	$scope.loading = false;

	Product.all().success(function (data) {
		$scope.products = data;
	});

	$scope.load = function  () {
		Product.all().success(function (data) {
			$scope.products = data;
		});
	}
	$scope.loadLastPage = function  () {
		$scope.lastPage = $scope.products.lastPage; 
		Product.getPage($scope.lastPage).success(function (data) {
			$scope.products = data;
		});
	}

	$scope.open = function (size, product) {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/confirm.html', 
			controller: 'ConfirmCtrl', 
			size: size, 
			resolve: {
				title: function () {
					return "Confirmar"; 
				},
				message: function () {
					return "Esta seguro de eliminar a " + product.name +"?"
				} 
			}
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function () {
			$scope.deleteProduct(product);
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});
	}

	$scope.update = function (size, product) {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/updateProduct.html', 
			controller: 'UpdateProductCtrl', 
			size: size, 
			resolve: {
				title: function () {
					return "Actualizar Producto"; 
				},
				product: function () {
					return product;
				} 
			}
		};
		var updateProductInstance = $modal.open(settings);
		updateProductInstance.result.then(function (data) {
			console.log(data);
			toastr.success(data.message);
		}, function () {
			$log.info("Actualizacion de producto cancelada a las: "+ new Date());
		});

	}

	$scope.storeProduct = function () {
		var product = document.getElementById("productForm");
		var formData = new FormData(product);
		$scope.loading = true;
		Product.store(formData).success(function (data) {
			if (data.error) {
				toastr.error(data.error);
			}else{
				$scope.product = {};
				$scope.loadLastPage();
				$scope.show = false;
				document.getElementById('name').focus();
				$scope.loading = false;
				toastr.success(data.message);
			}
		});		 
	}
	$scope.deleteProduct = function (product) {
		Product.delete(product).success(function (data) {
			toastr.success("Producto Eliminado");
			$scope.products = data;
		});
	}
	$scope.changePage = function (new_page) {
		Product.getPage(new_page).success(function (data) {
			$scope.products = data;
		});
	}
	$scope.searchProduct = function () {
		var search = {
			"value": $scope.value
		};
		Product.search(search).success(function (data) {
			if (data.error) {
				toastr.error(data.error);
				$scope.products = { "data" : []};
			}else{
				$scope.products = data;
			}
		});
	}

}]);