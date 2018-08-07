app.controller('UpdateUserCtrl', ['$scope',
 'user',
 '$modalInstance',
 'Calendar', 
 'Restangular',
 function ($scope, user, $modalInstance, Calendar, Restangular) {
	$scope.user = user;
/*	$scope.calendar = {
		days: Calendar.days(), 
		months: Calendar.months(), 
		years: Calendar.years(), 
	};
	$scope.$watch('day', function () {
		$scope.user.birthday = $scope.year+"-"+$scope.month +"-"+ $scope.day; 
	});
	$scope.$watch('month', function () {
		$scope.user.birthday = $scope.year+"-"+$scope.month +"-"+ $scope.day; 
	});
*/	
/*	$scope.$watch('year', function () {
		$scope.user.birthday = $scope.year+"-"+$scope.month +"-"+ $scope.day; 
	});*/
/*	$scope.$watch('identity_card_number', function () {
		$scope.user.identity_card = $scope.user.identity_card_number+"-"+$scope.identity_card_exp;
	});
	$scope.$watch('identity_card_exp', function () {
		$scope.user.identity_card = $scope.user.identity_card_number+"-"+$scope.identity_card_exp;
	});*/

	$scope.update = function () {
		Restangular.allUrl('auth/users/'+$scope.user.id).customPUT($scope.user).then(function (data) {
			$modalInstance.close(data);
		});
	}
}]);