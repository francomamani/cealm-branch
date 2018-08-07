app.service('Book', ["$resource", function ($resource) {
	return $resource('/api/v1/books/:id',{ id: '@id'});
}]);