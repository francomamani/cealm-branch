app.directive('mypagination', [function () {
	return {
		restrict: 'E',
		scope: { 
			results: '=', 
			select: '&'		
		},
		link: function (scope, elem, attrs) {
			var paginate  = function (results) {
				console.log(results);
				if (!scope.currentPage)
					scope.currentPage = 0;
				scope.total = results.total;
				scope.totalPages = results.last_page;
				scope.pages = [];
				
				for (var i = 1; i <= scope.totalPages; i++)
					scope.pages.push(i);
				
				scope.nextPage = function () {
					if (scope.currentPage < scope.totalPages)
						scope.currentPage++;

					scope.select({ new_page: scope.currentPage});
				};

				scope.prevPage = function () {
					if (scope.currentPage > 1) 
						scope.currentPage--;

					scope.select({ new_page: scope.currentPage});
				};

				scope.firstPage = function () {
					scope.currentPage = 1;
					scope.select({ new_page: scope.currentPage});
				};

				scope.lastPage = function () {
					scope.currentPage = scope.totalPages;
					scope.select({ new_page: scope.currentPage});
				};

				scope.setPage = function (page) {
					scope.currentPage = page;
					scope.select({ new_page: scope.currentPage});
				};
			};//paginate end

			var pageChange = function (newPage, lastPage) {
				if (!newPage == lastPage) 
					scope.$emit('page.changed', newPage);
			};

			scope.$watch('results', paginate);
			scope.$watch('currentPage', pageChange);
		},
		template: '<div class="text-center"><ul class="pagination pagination-sm" ng-show="totalPages > 1">' +
					'<li><a href="" ng-click="firstPage()">&laquo;</a></li>' +
					'<li><a href="" ng-click="prevPage()">&lsaquo;</a></li>' +
					'<li ng-repeat="n in pages">' +
					'<a href="" ng-bind="n" ng-click="setPage(n)">n</a>' +
					'</li>' +
					'<li><a href="" ng-click="nextPage()">&rsaquo;</a></li>' +
					'<li><a href="" ng-click="lastPage()">&raquo;</a></li>' +
					'</ul></div>',

	};
}])