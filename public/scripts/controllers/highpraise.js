app.controller('HighPraiseCtrl', ['$scope',
	'Restangular', 
	'$http',
	'$modal',
	'$log',
	'$filter',
	'Calendar',
	function ($scope, Restangular, $http, $modal, $log, $filter, Calendar) {
	/*
		LEVELS
		1. CURSOS
		2. TIPOS DE EXAMENES
		3. TIPOS DE CATEGORIAS
		4. LISTA DE ESTUDIANTES
		5. CALIFICACIONES
		6. CALIFACION DE ESTUDIANTES
		7. NOTAS DE ESTUDIANTES (EN LISTADO)
	*/
	$scope.pensum = null;
	$scope.groups = [];
	$scope.group = {};
	$scope.showLevel = 1;
	$scope.exam_type = {};
	$scope.exam_types = [];
	$scope.category_marks = [];
	$scope.students = [];
	$scope.teacher = JSON.parse(localStorage.getItem('user'));
	$scope.informationMarks = [];
	$scope.currentBimester = Restangular.one('auth/getcurrentbimester').get().$object;
	$http.get('api/v1/auth/groups_by_teacher').then(function (data) {
		$scope.groups = data.data;
	});
	$scope.counter = 0;

	$scope.selectExamType = function (group) {
		$scope.group = group;
		$scope.showLevel = 2;
		$http.get('api/v1/auth/exam_types_by_group/'+group.id).then(function (data) {
			$scope.exam_types = data.data;
			$scope.counter = 0;
			angular.forEach($scope.exam_types, function (exam) {
				$scope.counter += exam.percentage;
			});
		});
	}

	$scope.deleteExamType = function (exam_type, index) {
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
					return "Esta seguro de eliminar a " + exam_type.description + "?";
				} 
			}
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function () {
			$http.delete('api/v1/auth/exam_types/'+exam_type.id).then(function () {
				$scope.exam_types.splice(index, 1);
				$scope.counter -= exam_type.percentage;
			});
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});
	}
	$scope.addExamType = function () {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/addExamType.html', 
			controller: 'AddExamTypeCtrl', 
			size: 'md', 
			resolve: {
				title: function () {
					return "Añadir Tipo de Examen"; 
				}, 
				group: function () {
					return $scope.group; 
				},
				exam_types: function () {
				 	return $scope.exam_types;
				}, 
				counter: function () {
					return $scope.counter;
				} 
			}
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function (data) {
			$scope.exam_types.push(data);
			$scope.counter += data.percentage;
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});
	}
	$scope.updateExamType = function  (exam_type) {
		$http.get('api/v1/auth/exam_types/'+exam_type.id).then(function (exam) {
			$scope.counter = $scope.counter - exam.data.percentage;

			if ($scope.counter + parseInt(exam_type.percentage, 10) <= 100) {
				$scope.counter += parseInt(exam_type.percentage, 10);
				$http.put('api/v1/auth/exam_types/'+exam_type.id, exam_type).then(function (data) {
					toastr.success(data.data.success);
					exam_type.update = false;
				});				
			}else{
				toastr.error('Por favor revise los porcentajes');
				$scope.counter += exam.data.percentage;
			}
		});
	}

	$scope.addCategories = function (exam_type) {
		$scope.exam_type = exam_type;
		$scope.showLevel = 3;
		$scope.category_marks = Restangular.all('auth/category_marks_by_exam_type/'+exam_type.id).getList().$object;
	}

	$scope.addCategoryMark = function () {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/addCategoryMark.html', 
			controller: 'AddCategoryMarkCtrl', 
			size: 'md', 
			resolve: {
				title: function () {
					return "Aniadir Tipo de Categoria"; 
				}, 
				exam_type: function () {
					return $scope.exam_type; 
				}, 
				group: function () {
					return $scope.group;
				} 
			}
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function (data) {
			$scope.category_marks.push(data);
/*			$scope.counter += data.percentage;
			console.log($scope.counter + data.percentage);
			console.log(data.percentage);*/
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});
	}
	$scope.deleteCategoryMark  = function (category_mark, index) {
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
					return "Esta seguro de eliminar a " + category_mark.description + "?";
				} 
			}
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function () {
			$http.delete('api/v1/auth/category_marks/'+category_mark.id).then(function () {
				$scope.category_marks.splice(index, 1);
/*				console.log("category mark");
				console.log($scope.counter - category_mark.percentage);
				console.log(category_mark.percentage);
				$scope.counter = $scope.counter - category_mark.percentage;*/
			});
		}, function () {
			$log.info("Confirmación cancelada a las: "+ new Date());
		});
	}
	$scope.updateCategoryMark = function (category_mark) {
		$http.put('api/v1/auth/category_marks/'+category_mark.id, category_mark).then(function  (data) {
			toastr.success(data.data.success);
			category_mark.update = false;
		});
	}
	$scope.getStudents = function (group) {
		$scope.showLevel = 4;
		$scope.students = Restangular.all('auth/students_by_group/'+group.id).getList().$object;
		$scope.group = group;
	}
	$scope.getGroupScores = function (group) {
		$scope.showLevel = 7;
        $scope.group_scores = Restangular.all('auth/group_scores/'+group.id).getList().$object;
        $scope.group = group;
	}
	$scope.showScores = function (group) {
		$scope.group = group;
		$scope.showLevel = 5;
		Restangular.all('auth/information_marks_by_group/'+$scope.group.id).getList().then(function (data) {
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
		$scope.showLevel = 6;
		$scope.informationMark = informationMark;
		Restangular.all('auth/students_by_group/'+$scope.group.id).getList().then(function (students) {
			angular.forEach(students, function (student) {
				student.item_mark = Restangular.one('auth/item_mark_by_two/'+student.record.id+"/"+informationMark.id).get().$object;
			});
			$scope.students = students;
		});
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
	$scope.back = function () {
		$scope.showLevel = 5;
		$scope.showScores($scope.group);
	}
	/*PRINTING*/
	$scope.getInformationGroup = function (i, j) {
		switch(i){
			case 0:
				switch(j){
					case 0:
						return "COURSE LEADER";
					break;
					case 1:
						return "";
					break;
					case 2:
						return "BIMESTER";
					break;
					case 3:
						return "START";
					break;
					case 4:
						return "END";
					break;
					case 5:
						return "TIMETABLE";
					break;
				} 
			break;
			case 1:
				switch(j){
					case 0:
						return angular.uppercase($scope.teacher.lastname + " " + $scope.teacher.firstname);
					break;
					case 1:
                        return '';
					break;
					case 2:
						return $scope.currentBimester.name;
					break;
					case 3:
						return angular.uppercase($filter('date')($scope.currentBimester.from, 'mediumDate'));
					break;
					case 4:
						return angular.uppercase($filter('date')($scope.currentBimester.to, 'mediumDate'));
					break;
					case 5:
						return "10:00 - 12:00";
					break;
				}  
			break;
		}	
	}
	$scope.getMonthData = function (i) {
		var fromDate = new Date($scope.currentBimester.from);
		var toDate = new Date($scope.currentBimester.to);
		if (i == 0) {
			return angular.uppercase($filter('month')( fromDate.getUTCMonth()+1 ));
		}else{
			return angular.uppercase($filter('month')( toDate.getUTCMonth()+1 ));
		}
 	}	
	$scope.getTableData = function (i, j) {
		if (i == 0) {
			switch(j){
				case 0:
					return "N.";
				break;
				case 1:
					return "FULLNAME";
				break;
				default:
					return "";
			} 
		}else{
			switch(j){
				case 0:
					return $scope.students[i-1].number.toString();
				break;
				case 1:
					return angular.uppercase($scope.students[i-1].info.lastname) + " " + angular.uppercase($scope.students[i-1].info.firstname);
				break;
				default:
					return "";
			} 
		}
	}
	$scope.printGroupScores = function () {
        var pdf = new jsPDF('p','pt','letter');
        var source = document.getElementById('table-container').innerHTML;
        console.log(document.getElementById('table-container'));
        var margins = {
            top: 25,
            bottom: 60,
            left: 20,
            width: 522
        };
        // all coords and widths are in jsPDF instance's declared units
        // 'inches' in this case
/*        pdf.text(20, 20, 'Hello world.');*/
        pdf.fromHTML(source, margins.top, margins.left, {}, function() {
            pdf.save('test.pdf');
        });
	}
	$scope.calificaciones = function() {
        toastr.success('Ver carpeta de descargas', 'Descarga exitosa');
    }
	$scope.printList = function () {
        $http.get('api/v1/auth/get-pensum/'+$scope.group.id).then(function (pensumData) {
			var days = Calendar.generatedDays($scope.currentBimester.from, $scope.currentBimester.to);
			console.log(days);
            var x = 0.9;
            var y = 0.5;
            var width = 0;
            var height = 0;
            var innerWidth = 0;
            var rows = 0;
            var cols = 0 ;

            var doc = new jsPDF('l', 'in', 'letter'); //letter
            doc.setFont("arial");
            doc.setFontSize(13);
            doc.setFontType('bold');
			doc.text(x, y, 'ENROLLMENT LIST - '+$scope.group.name + ' | ' + pensumData.data.subject.pensum.name );
            /*table 1*/
            doc.setLineWidth(0.01);
            doc.setDrawColor(255,255,255);
            y += 0.2;
            width = 10;
            height = 0.3;
            rows = 2;
            cols = 6;
            doc.setFontSize(11);
            for(var i = 0 ; i <rows; i++){
                if (i==1) {
                    doc.setFontSize(10);
                    doc.setFontType('normal');
                };
                x = 0.8;
                for(var j=0 ; j<cols; j++){
                    if (j==0) {
                        innerWidth = 3,5;
                    }else{

                        innerWidth = 8/cols;
                    }
                    doc.rect(x, y, innerWidth, height); // empty square
                    data = $scope.getInformationGroup(i, j);
                    doc.text(x+0.1, y+0.2, data);
                    x += innerWidth;
                }
                y+=height;
            }
            /*end table 1*/
            doc.setDrawColor(0,0,0);
            /*table months*/
            doc.setLineWidth(0.01);
            doc.setFontSize(12);
            doc.setFontType('bold');
            y += .2;
            width = 6.7;
            height = 0.3;
            rows = 1;
            cols = 2;
            doc.setFontSize(11);
            x = 3.8;
            var data = "";
            innerWidth = width/2;
            for (var i = 0; i < cols; i++) {
                doc.rect(x, y, innerWidth, height);
                data = $scope.getMonthData(i);
                doc.text(x+innerWidth/2.6, y+0.2, data);
                x += innerWidth;
            };
            /*end table months*/
            /*table weeks*/
            doc.setLineWidth(0.01);
            doc.setFontSize(12);
            doc.setFontType('bold');
            y += height;
            width = 6.7;
            height = 0.3;
            rows = 1;
            cols = 8;
            doc.setFontSize(11);
            x = 3.8;
            innerWidth = width / cols;
            count = 1;
            for (var i = 0; i < cols; i++) {
                if (i == 4) {
                    count = 1;
                };
                doc.rect(x, y, innerWidth, height);
                doc.text(x+innerWidth/2.2, y+0.2, count.toString());
                x+=innerWidth;
                count++;
            };
            /*end table weeks*/

            /*table days*/
            doc.setLineWidth(0.01);
            doc.setFontSize(12);
            doc.setFontType('bold');
            y += height;
            width = 6.7;
            height = 0.3;
            rows = 1;
            cols = 40;
            doc.setFontSize(9);
            x = 3.8;
            innerWidth = width / cols;
            for (var i = 0; i < cols; i++) {
                doc.rect(x, y, innerWidth, height);
                if (days[i] < 10) {
                    doc.text(x+innerWidth/3, y+0.2, days[i].toString());
                }else{
                    doc.text(x+innerWidth/8, y+0.2, days[i].toString());
                }
                x+=innerWidth;
            };
            /*end table days*/

            /*table 2*/
            doc.setLineWidth(0.01);
            doc.setFontSize(12);
            doc.setFontType('bold');
            y += height;
            width = 10;
            height = 0.3;
            cols = 40;
            doc.setFontSize(11);
            for(var i = 0 ; i <= $scope.students.length; i++){
                if (i == 0) {
                    height = 0.3;//0.8
                }else{
                    height = 0.3;
                    doc.setFontSize(10);
                    doc.setFontType('normal');
                }
                innerWidth = 0;
                x = 0.5;
                for(var j = 0 ; j < cols+2; j++){
                    switch(j){
                        case 0:
                            innerWidth = .3; //.3 inch
                            doc.rect(x, y, innerWidth, height); // empty square
                            data = $scope.getTableData(i, j);
                            if (i==0) {
                                doc.text(x+0.1, y+0.2, data); //y+0.5
                            }else{
                                doc.text(x+0.1, y+0.2, data); //y+0.2
                            }
                            x += .3;
                            break;
                        case 1:
                            innerWidth = 3; // 3 inch
                            doc.rect(x, y, innerWidth, height); // empty square
                            data = $scope.getTableData(i, j);
                            if (i==0) {
                                doc.text(x+0.1, y+0.2, data);
                            }else{
                                doc.text(x+0.1, y+0.2, data);
                            }
                            x += 3;
                            break;
                        default:
                            innerWidth = 6.7 / cols; //5.7
                            doc.rect(x, y, innerWidth, height); // empty square
                            x += 6.7 / cols;
                    }
                }
                y+=height;
                if (y >= 7.7) {
                    doc.addPage();
                    doc.setLineWidth(0.01);
                    y = 0.5;
                };
            }
            /*end table 2*/
            if (y <= 7.1) {
                doc.setFontType("normal");
                doc.text(4.3, 7.7, angular.uppercase($scope.teacher.lastname)+" "+angular.uppercase($scope.teacher.firstname));
                doc.setFontType("bold");
                doc.text(4.3, 8,"COURSE LEADER SIGNATURE");
            }else{
                doc.addPage();
                doc.setLineWidth(0.01);
                doc.setFontType("normal");
                doc.text(4.3, 7.7, angular.uppercase($scope.teacher.lastname)+" "+angular.uppercase($scope.teacher.firstname));
                doc.setFontType("bold");
                doc.text(4.3, 8,"COURSE LEADER SIGNATURE");
            }

            doc.save("HORARIO-"+$scope.group.name+".pdf");
        });
	}	
}]);