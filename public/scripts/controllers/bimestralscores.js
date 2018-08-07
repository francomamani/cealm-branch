app.controller('BimestralScoresCtrl', ['$scope',
 'Restangular',
 '$modal',
 '$log',
 function ($scope, Restangular, $modal, $log) {
 	$scope.structure = {};
	$scope.renderScores = function () {
		var settings = {
			animation: true, 
			templateUrl: 'partials/widgets/renderScores.html', 
			controller: 'RenderScoresCtrl', 
			size: 'md' 
		};
		var confirmInstance = $modal.open(settings);
		confirmInstance.result.then(function (data) {
			$scope.structure = data;
			console.log($scope.structure);
		}, function () {
			$log.info("Cambio de rol cancelado a las: "+ new Date());
		});	
	}
	$scope.getStudent = function (id) {
		return Restangular.one('auth/get_student/'+id).get().$object;
	}
	$scope.splice2 = function(cad, idx, rem, str) {
    	return cad.slice(0, idx) + str + cad.slice(idx + Math.abs(rem));
	};

	$scope.export = function () {


		data = $scope.structure.group;
		var csvContent = "data:text/csv;charset=utf-8,";
		csvContent += "PARALELO:; " + data.name+";;";
		csvContent += "INICIO: ;" + data.from+";;";
		csvContent += "FIN: ;" + data.to+"\n;;";
		angular.forEach(data.exam_types, function (exam_type, index) {
			csvContent += exam_type.description + " " + exam_type.percentage + "%";
			angular.forEach(exam_type.category_marks, function (category_mark) {
					for (var j = 0; j < category_mark.information_marks.length; j++) {
						csvContent += ';';
					}
					csvContent += ';';
			});
		});
		count = 0;
		csvContent += "\n";
		csvContent += "N.;APELLIDOS Y NOMBRES;";

		angular.forEach(data.exam_types, function (exam_type, index) {
			angular.forEach(exam_type.category_marks, function (category_mark) {
				csvContent += category_mark.description+" "+category_mark.percentage+"%;";
				for (var i = 0; i < category_mark.information_marks.length; i++) {
					csvContent += ';';
				};
			});
		});
	    csvContent += "\n;;";
		//students hash
	    var rows = [];
	    var students = $scope.structure.students;
	    angular.forEach(students, function (student, index) {
	    	console.log(student);
	    	rows.push({
	    		student_id: student.id,
	    		scores: []
	    	});
	    });
	    //edn students

		angular.forEach(data.exam_types, function (exam_type, index) {
			angular.forEach(exam_type.category_marks, function (category_mark) {
				angular.forEach(category_mark.information_marks, function (information_mark) {
						csvContent += information_mark.title+';';
						angular.forEach(information_mark.item_marks, function (item_mark) {
							
						});
				});				
				csvContent += ';';						
			});
		});
	    csvContent += "\n";
	    var counter = 0;
	    counter++;
		csvContent += counter+";"; 
		position = csvContent.length;
		angular.forEach(data.exam_types, function (exam_type, index) {
			angular.forEach(exam_type.category_marks, function (category_mark) {
				angular.forEach(category_mark.information_marks, function (information_mark) {
						angular.forEach(information_mark.item_marks, function (item_mark) {
							student_name = item_mark.record.pensum_record.student.user.lastname + " " + item_mark.record.pensum_record.student.user.firstname + ";";
							csvContent += $scope.splice2(csvContent, position, 0, student_name + ";");
							csvContent += item_mark.score;
						});
				});				
				csvContent += ';';						
			});
		});
		csvContent += '\n';						

/*	    angular.forEach(students, function (student, index) {
	    	csvContent += (index + 1) +";"+ student.lastname + " " + student.firstname + "\n";
	    });*/

/*		data.forEach(function(infoArray, index){

		   dataString = infoArray.join(";");

		}); */
		var encodedUri = encodeURI(csvContent);
		var link = document.createElement("a");
		link.setAttribute("href", encodedUri);
		link.setAttribute("download", "notas_bimestrales.csv");

		link.click();

//		document.body.appendChild(link);
/*        var blob = new Blob([document.getElementById('exportable').innerHTML], {
            type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8"
        });
        saveAs(blob, "Report.xls");*/
	}

}]);