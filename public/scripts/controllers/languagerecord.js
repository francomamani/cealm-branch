app.controller('LanguageRecordCtrl', ['$scope', 
	'Restangular', function ($scope, Restangular) {
	$scope.language = {
		name: ""
	};	
	$scope.category = {
		language_id : "",
		description: ""
	};
	$scope.categories = [];
	$scope.selectedLanguage = {};
	$scope.$watch('language.name', function () {
		$scope.language.name = angular.uppercase($scope.language.name);
	});
	$scope.$watch('category.description', function () {
		$scope.category.description = angular.uppercase($scope.category.description);
	});
	$scope.languages = Restangular.all('auth/languages').getList().$object;
	$scope.showCategory = false;
	$scope.withoutCategories = false;
	$scope.reloadLanguages = function () {
		$scope.languages = Restangular.all('auth/languages').getList().$object;
	}
	$scope.reloadCategories = function () {
		$scope.categories = Restangular.all('auth/categories_by_language/'+$scope.selectedLanguage.id).getList().$object;
	}

	$scope.resetLanguage = function () {
		$scope.language = {
			name: ""
		};	
	}	
	$scope.storeLanguage = function (language) {
/*		console.log($scope.language);*/
		Restangular.all('auth/languages').post(language).then(function (data) {
			if (data.success) {
				toastr.success(data.success, "Exito");
			};
		});
		$scope.resetLanguage();
		$scope.reloadLanguages();
	}
	$scope.updateLanguage = function (language) {
		language.update = !language.update;
		Restangular.one('auth/languages/'+language.id).customPUT(language).then(function (data) {
			toastr.success(data.success); 
		});  
	}
	$scope.deleteLanguage = function (language, index) {
		language.remove().then(function (data) {
			if (data.error) {
				toastr.error('Imposible eliminar el idioma', data.error);
			}else{
				$scope.languages.splice(index, 1);
			}
		});

	}
	$scope.updateCategory = function (category, index) {
		category.update = !category.update;
		Restangular.one('auth/categories/'+category.id).customPUT(category).then(function (data) {
			$scope.categories.splice(index, 1, data);
		});  
	}

	$scope.deleteCategory = function (category, index) {
		Restangular.one('auth/categories/'+category.id).remove().then(function (data) {
			$scope.categories.splice(index, 1);
			if (data.success) {
				toastr.success(data.success);
			};
		});  
	}
	$scope.adminCategories = function (language) {
		$scope.selectedLanguage = language; 
		$scope.categories = Restangular.all('auth/categories_by_language/'+language.id).getList().$object;
		$scope.showCategory = true; 
	}
	$scope.resetCategory = function () {
		$scope.category = {
			language_id : "",
			description: ""
		};
	}
	$scope.storeCategory = function () {
		$scope.category.language_id = $scope.selectedLanguage.id; 
		Restangular.all('auth/categories').post($scope.category).then(function (data) {
			if (data.success) {	
				$scope.resetCategory();
				toastr.success(data.success); 
				$scope.reloadCategories(); 
			};
		}); 
	}

}]);