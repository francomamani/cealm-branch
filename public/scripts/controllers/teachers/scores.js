app.controller('ScoresCtrl', ['$scope', 
	'Restangular', 
	'$http', 
	'$modal',
	function ($scope, Restangular, $http, $modal) {

	$scope.bimester = {};
	$scope.teacher = {};
	$scope.group = {};
	$scope.groups = [];
	$scope.informationMark = {};
	$scope.informationMarks = [];
	$scope.sw = false;	
	$scope.students = [];
	Restangular.one('auth/getcurrentbimester').get().then(function (bimester) {
		$scope.bimester = bimester;
		Restangular.one('auth/current_teacher').get().then(function (teacher) {
			$scope.teacher = teacher;
			$http.get('api/v1/auth/teacher_groups_by_bimester/'+teacher.id+'/'+bimester.id).success(function (data) {
				$scope.groups = data;
			});
		});
	});	
	$scope.showScores = function () {
		var group = JSON.parse($scope.group);
		Restangular.all('auth/information_marks_by_group/'+group.id).getList().then(function (data) {
			angular.forEach(data, function (information_mark) {
				information_mark.end_date = new Date(information_mark.end_date); 
				information_mark.category_mark = Restangular.one('auth/category_marks/'+information_mark.category_mark_id).get().$object;
				information_mark.exam_type = Restangular.one('auth/exam_types/'+information_mark.exam_type_id).get().$object;
			});
			$scope.informationMarks = data;
		});
	}

	$scope.addScore = function () {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/addScore.html', 
			controller: 'AddScoreCtrl', 
			size: 'md', 
			resolve: {
				title: function () {
					return "Adicionar Nuevo Casillero"; 
				}, 
				group: function () {
					return $scope.group;
				}
			}
		};
		var modal = $modal.open(settings);
		modal.result.then(function (data) {
			data.category_mark = Restangular.one('auth/category_marks/'+data.category_mark_id).get().$object;
			data.exam_type = Restangular.one('auth/exam_types/'+data.exam_type_id).get().$object;
			data.end_date = new Date(data.end_date);
			$scope.informationMarks.push(data);
		});		
	}
	$scope.studentScores = function (informationMark) {
		var group  = JSON.parse($scope.group);
		$scope.sw = true;
		$scope.informationMark = informationMark;
		Restangular.all('auth/students_by_group/'+group.id).getList().then(function (students) {
			angular.forEach(students, function (student) {
				student.item_mark = Restangular.one('auth/item_mark_by_two/'+student.record.id+"/"+informationMark.id).get().$object;
			});
			$scope.students = students;
		});
	}
	$scope.back = function () {
		$scope.sw = false;
		$scope.showScores();
	}
	$scope.saveScores = function () {
		angular.forEach($scope.students, function (student) {
			var json = {
				record_id: student.record.id, 
				information_mark_id: $scope.informationMark.id, 
				observation: student.item_mark.observation, 
				score: student.item_mark.score
			}
			Restangular.all('auth/item_marks').post(json);
		});
		toastr.success('Registro de notas guardado', 'Guardado');
	}	
	$scope.updateInformationMark = function (information_mark) {
		var end_date = new Date(information_mark.end_date);
		information_mark.end_date = end_date;
		$http.put('api/v1/auth/information_marks/'+information_mark.id, information_mark).then(function (data) {
			information_mark.update = false;
			toastr.success(data.data.success);
		});
	}
	$scope.deleteInformationMark = function (information_mark, index) {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/confirm.html', 
			controller: 'ConfirmCtrl', 
			size: 'md', 
			resolve: {
				title: function () {
					return "Confirmar"; 
				},
				message: function () {
					return "Esta seguro de eliminar el " + information_mark.title +"?";
				} 
			}
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function () {
			$http.delete('api/v1/auth/information_marks/'+information_mark.id).then(function () {
				$scope.informationMarks.splice(index, 1);
			});
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});
	}
}]);