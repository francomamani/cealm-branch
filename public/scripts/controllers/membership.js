app.controller('MembershipCtrl', ['$scope', 
	'User',
	'$modal',
	function ($scope, User, $modal) {

	User.all().success(function (data) {
		$scope.users = data; 
	}); 
	$scope.open = function (size, user) {
		console.log("hello! :D");
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
					return "Esta seguro de eliminar a " + user.firstname + " " + user.lastname +"?"
				} 
			}
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function () {
			$scope.deleteUser(user);
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});
	}

	$scope.changePage = function (new_page) {
		User.getPage(new_page).success(function (data) {
			$scope.users = data;
		}); 
	}

	$scope.deleteUser = function (user) {
		User.delete(user.id).success(function (data) {
			$scope.users = data; 
		}); 
	}

}]);
