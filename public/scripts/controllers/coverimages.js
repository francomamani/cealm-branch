app.controller('CoverImagesCtrl', ['$scope',
 'Upload',
 'Restangular',
 '$http',
 '$modal',
 '$log',
 function ($scope, Upload, Restangular, $http, $modal, $log) {
    $scope.$watch('files', function () {
        $scope.upload($scope.files);
    });

	$scope.cover_image = {
		description: "",
	};
    $scope.progressPercentage = 0;
	$scope.showUpload = false;
    $scope.cover_images = Restangular.all('auth/cover_images').getList().$object;

	$scope.ok = function () {
		if ($scope.cover_image.description != "") {
			$scope.showUpload = true; 
		}else{
			toastr.error("Por favor llena el campo de descripcion primero.");
		}
	}
    $scope.upload = function (files) {
        if ($scope.cover_image.description != '') {
            if (files && files.length) {
                for (var i = 0; i < files.length; i++) {
                    var file = files[i];
                    Upload.upload({
                        url: '/api/v1/auth/cover_images',
                        fields: $scope.cover_image,
                        file: file
                    }).progress(function (evt) {
                        $scope.progressPercentage = parseInt(100.0 * evt.loaded / evt.total);
                        console.log('progress: ' + $scope.progressPercentage + '% ' + evt.config.file.name);
                    }).success(function (data, status, headers, config) {
                        $scope.cover_images.unshift(data);
                        console.log(data);
                        $scope.progressPercentage = 0;
                        toastr.success('Archivo ' + config.file.name + ' subido exitosamente');
                    });
                }
            }
        }else{ /*end subject*/
            toastr.info('Por favor llena el campo de descripcion primero', 'Tip');
        }           

    };
    $scope.deleteCoverImage = function (cover, index) {
        var settings = {
            animation: true, 
            templateUrl: 'partials/widgets/confirm.html', 
            controller: 'ConfirmCtrl', 
            size: "md", 
            resolve: {
                title: function () {
                    return "Confirmar"; 
                },
                message: function () {
                    return "Esta seguro de eliminar esta imagen?"
                } 
            }
        };
        var confirmInstance = $modal.open(settings);
        confirmInstance.result.then(function () {
            $http.delete('api/v1/auth/cover_images/'+cover.id).then(function (data) {
                $scope.cover_images.splice(index, 1);
            });
        }, function () {
            $log.info("Confirmación cancelada a las: "+ new Date());
        });        

    }
    $scope.updateCoverImage = function (cover) {
        $http.put('api/v1/auth/cover_images/'+cover.id , cover).then(function () {
            cover.update = false;
        });
    }
}]);