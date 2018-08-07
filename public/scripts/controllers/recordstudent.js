app.controller('RecordStudentCtrl', ['$scope', 'Restangular', function ($scope, Restangular) {
	$scope.user = {};
	$scope.expedition = null;
	$scope.cities = [
		{
			acronym: "OR",
			city: "ORURO"
		},
		{
			acronym: "LPZ",
			city: "LA PAZ"
		},
		{
			acronym: "PT",
			city: "POTOSI"
		},
		{
			acronym: "SC",
			city: "SUCRE"
		},
		{
			acronym: "CBBA",
			city: "COCHABAMBA"
		},
		{
			acronym: "BN",
			city: "BENI"
		},
		{
			acronym: "PD",
			city: "PANDO"
		},
		{
			acronym: "SCZ",
			city: "SANTA CRUZ"
		},																			
		{
			acronym: "TJ",
			city: "TARIJA"
		}			
	];

	$scope.$watch('day', function () {
		$scope.user.birthday = $scope.year+"-"+$scope.month +"-"+ $scope.day; 
	});
	$scope.$watch('month', function () {
		$scope.user.birthday = $scope.year+"-"+$scope.month +"-"+ $scope.day; 
	});
	$scope.$watch('year', function () {
		$scope.user.birthday = $scope.year+"-"+$scope.month +"-"+ $scope.day; 
	});
	$scope.$watch('identity_card_number', function () {
		$scope.user.identity_card = $scope.user.identity_card_number+"-"+$scope.identity_card_exp;
	});
	$scope.$watch('expedition.acronym', function () {
		$scope.user.identity_card = $scope.user.identity_card_number+"-"+$scope.identity_card_exp;
	});
	
	$scope.register = function (user) {
		user.identity_card = $scope.user.identity_card_number+"-"+$scope.identity_card_exp;
		Restangular.all('auth/register_student').post(user).then(function (data) {
			toastr.success(data.success);
			$scope.user = {};
			$scope.identity_card_exp= '';
            $scope.year = '';
            $scope.month = '';
            $scope.day = '';
		});
	}
}]);