app.filter('control', function () {
	return function (value) {
		if (value != null) {
			if (value) {
				return "ENTRADA";
			}else{
				return "SALIDA";
			}			
		};
	}
});