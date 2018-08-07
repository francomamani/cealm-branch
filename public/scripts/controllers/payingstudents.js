app.controller('PayingStudentsCtrl', ['$scope',
 'Restangular',
 '$modal',
 '$http',
 '$timeout',
 'Currency',
 function ($scope, Restangular, $modal, $http, $timeout, Currency) {
	/*
		1: show kind of payments
		2. tuition
		2.1. groups
		2.2 estudiantes al dia
		2.3 estudiantes retrasados
	*/
	$scope.user = JSON.parse(localStorage.getItem('user'));
	$scope.student = {};
	$scope.groups = [];
	$scope.showLevel = 1;
	$scope.students = [];
	$scope.pensums = Restangular.all('auth/pensums').getList().$object;
	$scope.tuitionPensums = function () {
		$scope.showLevel = 2;
	}	
	$scope.tuitionGroups = function (pensum) {
		$scope.showLevel = 2.1;
		$scope.groups = Restangular.all('auth/current_groups_by_pensum/'+pensum.id).getList().$object;
	}
	$scope.tuitionStudentsAtTime = function (group) {
		$scope.showLevel = 2.2;
		$scope.students = Restangular.all('auth/paid_tuitions/'+group.id).getList().$object;
/*		$scope.students = Restangular.all('auth/students_tuition_by_group/'+group.id).getList().$object;*/
	}
	$scope.tuitionStudentsOutTime = function (group) {
		$scope.showLevel = 2.3;
		$scope.students = Restangular.all('auth/unpaid_tuitions/'+group.id).getList().$object;
	}
	$scope.payTuition = function (user, index) {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/payTuition.html', 
			controller: 'PayTuitionCtrl', 
			size: 'md', 
			resolve: {
				title: function () {
					return "Pagar Matricula"; 
				},
				pensum_record_id: function () {
					return user.pensum_record_id;
				}
			}
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function () {
			$scope.students.splice(index, 1);
			toastr.success('Enhorabuena has pagado tu matricula del anio')
		}, function () {
			$log.info("Pago de matricula cancelado a las: "+ new Date());
		});
	}
	$scope.updateTuition = function (tuition) {
		tuition.update = false;
		$http.put('api/v1/auth/tuitions/'+tuition.id, tuition).then(function (data) {
			toastr.success(data.data.success);
		});
	}
	$scope.printTuition = function (student) {
		$scope.student = student;
		$scope.date = new Date(student.created_at);
		$scope.tuition_day = $scope.date.getUTCDate();
		$scope.tuition_month = $scope.date.getUTCMonth()+1;
		$scope.tuition_year = $scope.date.getUTCFullYear();

		$scope.student.literal_price = Currency.NumeroALetras(Math.floor(student.price));
		var decimal = Math.round(student.price % 1 * 100);
		if (decimal == 0) {
			$scope.student.decimal_price  = "0" + decimal.toString();
		}else{
			$scope.student.decimal_price  = decimal.toString();			
		}

		$timeout(function () {
			var w = window.open("", "_blank", "toolbar=no, scrollbars=yes, resizable=no, top=200, left=300, width=600, height=400");
			w.document.write($('#section-to-print').html());
		}, 500);
/*		w.print();*/
/*		w.close();*/
	}

}]);