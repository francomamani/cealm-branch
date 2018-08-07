app.controller('DocumentReceptionCtrl', ['$scope', 
	'Student', 
	'$filter',
	'Restangular',
	'Upload',
	function ($scope, Student, $filter, Restangular, Upload) {
	$scope.students = [];
	$scope.showSearch = false;
	$scope.empty = false;
	$scope.documentReception = {};
	$scope.existFolio = false;
	$scope.documents = [
		{
			type: 'CARNET DE IDENTIDAD'
		},
		{
			type: 'TÍTULO DE BACHILLER'
		},
		{
			type: 'FOTO'
		},
		{
			type: 'CERTIFICADO DE NACIMIENTO'
		}
	];
	$scope.search = function (value) {
		if(value != ''){		
			Restangular.all('auth/get_search_students/'+value).getList().then(function (data) {
				console.log(data);
				$scope.students = data;
				if (data[0] != null) {
					$scope.showSearch = true;
					$scope.empty = false;
				}else{
					$scope.empty = true;
					$scope.showSearch = false;
				}
			});
/*			Student.searchGlobal({value: value}).success(function (data) {
			});*/
		}
	}
	$scope.selectObject = function (s) {
		$scope.student = s;
		$scope.showSearch = false;
		$scope.value = s.lastname.toUpperCase() + " " + s.firstname.toUpperCase();
		Restangular.one('auth/get_document_reception/'+s.student_id).get().then(function (documentReception) {
			if (documentReception != null ) {
				$scope.documentReception = documentReception; 
				$scope.existFolio = true;
			};
		});
	}
	$scope.createFolio = function (s) {
		var data = {
			student_id: s.student_id,
			code: new Date().getUTCFullYear() + '-' + s.identity_card
		};
		Restangular.all('auth/documents_reception').post(data).then(function (response) {
			$scope.documentReception = response;
			$scope.documents = Restangular.all('auth/get_documents/'+response.id).getList().getObject;
		});
	}
	$scope.submit = function() {
		$scope.upload($scope.file);
	};
	$scope.upload = function (file) {
        Upload.upload({
            url: 'api/v1/auth/documents',
  	        file: file, 
	        data: {
		    	'type': $scope.document.title, 
		    	'document_reception_id': $scope.documentReception.id  	        	
  	        }
        }).then(function (resp) {
        	$scope.documents.push(resp);
            console.log('Success ' + resp.config.data.file.name + 'uploaded. Response: ' + resp.data);
        }, function (resp) {
            console.log('Error status: ' + resp.status);
        }, function (evt) {
            var progressPercentage = parseInt(100.0 * evt.loaded / evt.total);
//            console.log('progress: ' + progressPercentage + '% ' + evt.config.data.file.name);
        });
    };

}]);