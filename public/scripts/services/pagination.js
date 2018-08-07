app.factory('Pagination', [function () {
	return {
		pages : function (total) {
			var list = [];
			for (var i = 1; i <= total; i++) {
				var json ={
					page: i
				};
			};
		}
	};
}])