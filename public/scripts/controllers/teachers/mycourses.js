app.controller('MyCoursesCtrl', ['$scope',
	'Restangular',
	'$http',
	'Calendar',
	'$filter',
	function ($scope, Restangular, $http, Calendar, $filter) {

	$scope.group = {};
	$scope.groups = [];
	$scope.students = [];
	$scope.teacher = {};
	$scope.showList = false;
	$scope.currentBimester = Restangular.one('auth/getcurrentbimester').get().$object;
	
	$http.get('api/v1/auth/groups_by_teacher').then(function (data) {
		$scope.groups = data.data;
	});

	$scope.getStudents = function (group) {
		$scope.showList = true;
		$scope.students = Restangular.all('auth/students_by_group/'+group.id).getList().$object;
		$scope.teacher = Restangular.one('auth/teacher_by_group/'+group.id).get().$object;
		$scope.group = group;
	}
	$scope.getInformationGroup = function (i, j) {
		switch(i){
			case 0:
				switch(j){
					case 0:
						return "COURSE LEADER";
					break;
					case 1:
						return "LANGUAGE";
					break;
					case 2:
						return "BIMESTER";
					break;
					case 3:
						return "BEGIN";
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
						return "INGLES";
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
	$scope.printList = function () {
		var days = Calendar.bimesterDays($scope.currentBimester.from, $scope.currentBimester.to);
		console.log("Dias: "+days);
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
		doc.text(x, y, 'ENROLLMENT LIST - '+$scope.group.name);

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

		doc.save("horario.pdf");
	}
	
}]);