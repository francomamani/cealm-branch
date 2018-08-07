app.controller('EnableParallelCtrl', [
	'$scope', 
	'Restangular',
	'$http',
	'Calendar',
	function ($scope, Restangular, $http, Calendar) {

	$scope.editing = false;
	$scope.hours = Calendar.hours();
	$scope.pensums = Restangular.all('auth/pensums').getList().$object;
	$scope.pensum_id = "";
	$scope.pensum_selected = false;
	$scope.subject = {};
	$scope.bimester = Restangular.one('auth/getcurrentbimester').get().$object;
	$scope.rooms = Restangular.all('auth/rooms').getList().$object;
	$scope.group = {
        "teacher_id" : 0,
        "subject_id" : 0,
        "bimester_id" : 0,
        "room_id" : 0,
        "parallel" : "",
        "name" : "",
        "from" : "",
        "to" : "",
        "subject" : {}
	};
	Restangular.one('auth/getcurrentbimester').get().then(function (bimester) {
		$scope.group.bimester_id = bimester.id;
	});
	$scope.groups = [];
	$scope.teachers = Restangular.all('auth/teachers').getList().$object;
	$scope.parallels = Restangular.all('auth/current_groups_by_teacher').getList().$object;

	$scope.updateList = function () {
        $scope.parallels = Restangular.all('auth/current_groups_by_teacher').getList().$object;
    }

	$scope.loadAsignaturas = function (pensum_id){
        $scope.pensum_selected = true;
        $http.get('api/v1/auth/subjects_by_pensum/'+pensum_id).then(function (data) {
			$scope.subjects = data.data;
			console.log($scope.subjects);
        });
	}


	$scope.save = function (group) {
		group.subject_id = JSON.parse(group.subject).id;
		group.name = JSON.parse(group.subject).subject_code + "-" + group.parallel;
		console.log(group);
		Restangular.all('auth/groups').post($scope.group).then(function (data) {
			if (data.error) {
				toastr.error(data.error);
			} else {
                toastr.success("Grupo creado exitosamente");
                console.log(data);
                $scope.parallels.push(data);
			}
		});
	}

	$scope.deleteGroup = function (group_id, index) {
		Restangular.one('auth/groups/'+group_id).remove().then(function (data) {
			if (data.success) {
				$scope.parallels.splice(index, 1);
				toastr.success(data.success);				
			}else{
				toastr.error("Eliminación no permitida", data.error);								
			}
		});
	}
	$scope.editGroup = function (group_id, index) {
		$scope.editing = true;
        Restangular.one('auth/groups/'+group_id).get().then(function (data) {
        	$scope.group.id = parseInt(data.id)
        	$scope.group.teacher_id = parseInt(data.teacher_id, 10) ;
			$scope.group.subject_id = parseInt(data.subject_id);
			$scope.group.bimester_id = parseInt(data.bimester_id, 10);
			$scope.group.room_id = parseInt(data.room_id, 10);
			$scope.group.parallel = data.parallel;
			$scope.group.name = data.name;
			$scope.group.from = data.from.substring(0, 5);
			$scope.group.to = data.to.substring(0, 5);
        	console.log($scope.group);
        });
    }
    $scope.update = function (group) {
		group.subject_id = parseInt(JSON.parse(group.subject).id);
        group.name = JSON.parse(group.subject).subject_code + "-" + group.parallel;
        console.log(group);
        $http.put('api/v1/auth/groups/'+group.id, $scope.group).then(function (data) {
            if (data.error) {
                toastr.error(data.error);
            } else {
                toastr.success("Grupo actuaizado exitosamente");
                console.log(data);
                $scope.editing = false;
            }
        });
		$scope.updateList();
    }

}]);