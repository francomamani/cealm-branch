app.factory('Product', ['$http', function ($http) {
	return {
		all: function () {
			return $http.get('api/v1/auth/products');
		},
		getPage: function (new_page) {
			return $http.get('api/v1/auth/products?page='+new_page);
		}, 
		store: function (product) {
			var settings = {
		        withCredentials: true,
				headers: {'Content-Type': undefined },
        		transformRequest: angular.identity
        	};
			return $http.post('api/v1/auth/products', product, settings);
		},
		update: function (product) {
			return $http.put('api/v1/auth/products/'+product.id, product);
		},
		delete: function (product) {
			return $http.delete('api/v1/auth/products/'+product.id);
			//return this.all();
		},
		search: function (value) {
			return $http.post('api/v1/search/products', value);
		}
	};
}])