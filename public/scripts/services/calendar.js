app.factory('Calendar', ['$filter', function ($filter) {
	return {
		generatedDays: function(from, to){
			var fromDate = new Date(from);
			var toDate = new Date(to);
			var desde = fromDate.getUTCMonth()+1;
			var hasta = toDate.getUTCMonth()+1;
			var dates = [];
			//dias de los meses
            fromDays = new Date(fromDate.getUTCFullYear(), fromDate.getUTCMonth()+1, 0).getUTCDate();
            toDays = new Date(toDate.getUTCFullYear(), toDate.getUTCMonth()+1, 0).getUTCDate();
			//desde y hasta son meses del anio
            for (var i = desde; i<= hasta; i++) {
            	var fecha = 0;
            	if (i === fromDate.getUTCMonth()+1){
                    fecha = fromDate.getUTCDate();
				} else {
            		fecha = 1;
				}
				for ( var j= fecha; j<= new Date(fromDate.getUTCFullYear(), i, 0).getUTCDate(); j++) {
            		dates.push(j);
				}
			}
			return dates;
		},
		bimesterDays: function (from, to) {
			var fromDate = new Date(from);
			var toDate = new Date(to);
			fromDays = new Date(fromDate.getUTCFullYear(), fromDate.getUTCMonth()+1, 0).getUTCDate();
			toDays = new Date(toDate.getUTCFullYear(), toDate.getUTCMonth()+1, 0).getUTCDate();
			var dates = [];
			var count = 0;
			for (var i = fromDate.getUTCDate(); i <= fromDays; i++) {
				count++;
				if (count<6) {
					dates.push(i);
				};
				if (count==7) {
					count = 0;
				};
			};
			for (var i = 1; i <= toDate.getUTCDate(); i++) {
				count++;
				if (count<6) {
					dates.push(i);
				};
				if (count==7) {
					count = 0;
				};
			};
			return dates;

		},
		correctBimester: function (from, to) {
			var fromDate = new Date(from);
			var toDate = new Date(to);
			fromDays = new Date(fromDate.getUTCFullYear(), fromDate.getUTCMonth()+1, 0).getUTCDate();
			toDays = new Date(toDate.getUTCFullYear(), toDate.getUTCMonth()+1, 0).getUTCDate();

			if (fromDate.getUTCMonth() ==  toDate.getUTCMonth()) {
				return {
					"sameMonth": "El bimestre debe tener dos meses diferentes",
					"correct": false 
				};				
			}else{
				var days = this.bimesterDays(from, to);
				if (days.length == 40) {
					return {
						"availableDays": days.length,
						"correct": true 
					};
				}else{
					return {
						"availableDays": days.length,
						"correct": false 
					};
				}
			}
		},		
		literalDays: function () {
			var days = [];
			for (var i = 1; i <= 7; i++){ 
				days.push({ 'day' : $filter('days')(i) });
			};
			console.log(days);
			return days;
		},
		hours: function  () {
			var hours = [];
			for (var i = 6; i <= 22; i++) {
				for (var j = 0; j <= 59; j+=30) {
					if (i<10) {
						if (j<10) {
							hours.push({hour: '0'+i+":"+'0'+j});				
						}else{
							hours.push({hour: '0'+i+":"+j});											
						}
					}else{
						if (j<10) {
							hours.push({hour: i+":"+'0'+j});				
						}else{
							hours.push({hour: i+":"+j});											
						}
					}
				};
			};
			return hours;
		},
		days: function () {
			var days = [];
			for (var i = 1; i <= 31; i++) {
				days.push({ 'day' : i});
			};
			return days;
		}, 
		months: function () {
			var months = [];
			for (var i = 1; i <= 12; i++) {
				months.push({ 'month' : i});
			};
			return months;
		}, 
		years: function () {
			var years = [];
			for (var i = new Date().getUTCFullYear(); i >= 1905 ; i--) {
				years.push({ 'year' : i});
			};
			return years;
		}, 
		pensumyears: function  () {
			var years = [];
			for (var i = new Date().getUTCFullYear(); i >= 1990 ; i--) {
				years.push({ 'year' : i});
			};
			return years;
		},
		currentDate: function () {
			var date = new Date();
			var day = date.getUTCDate();
			var month = date.getUTCMonth() + 1;
			var year = date.getUTCFullYear();
			if (day < 10) {
				day = "0"+day;
			}else{
				day = day.toString();
			}
			if (month < 10) {
				month = "0"+month;				
			}else{
				month = month.toString();
			}
			var now = {
				'day' : day,
				'month': month,
				'year': year.toString() 
			};
			return now;
		}
	};
}]);