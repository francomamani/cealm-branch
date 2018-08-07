app.controller('HomeworksCtrl', ['$scope',
    'Upload',
    'Plan',
    '$http',
    function ($scope, Upload, Plan, $http) {

        $scope.$watch('files', function () {
            $scope.upload($scope.files);
        });
        $scope.plan = {
            'subject': ''
        };
        $scope.plans = [];
        $scope.students = [];
        $scope.progressPercentage = 0;
        $http.get('/api/v1/auth/students').then(function (students) {
            $scope.students = students.data;
            console.log($scope.students);
        });

        Plan.myPlans().success(function (data) {
            $scope.plans = data;
            console.log($scope.plans);
        });

        $scope.load = function () {
            Plan.myPlans().success(function (data) {
                $scope.plans = data;
            });
        }

        $scope.upload = function (files) {
            if ($scope.plan.subject != '') {
                if (files && files.length) {
                    for (var i = 0; i < files.length; i++) {
                        var file = files[i];
                        Upload.upload({
                            url: '/api/v1/auth/planes',
                            fields: $scope.plan,
                            file: file
                        }).progress(function (evt) {
                            $scope.progressPercentage = parseInt(100.0 * evt.loaded / evt.total);
                            console.log('progress: ' + $scope.progressPercentage + '% ' + evt.config.file.name);
                        }).success(function (data, status, headers, config) {
                            $scope.plans.data.push(data);
                            toastr.success('Archivo ' + config.file.name + ' subido exitosamente');
                        });
                    }
                }
            }else{ /*end subject*/
                /*            document.getElementById('subject').focus();*/
                toastr.info('Por favor llene el campo asunto', 'Tip');
            }
        };

    }]);