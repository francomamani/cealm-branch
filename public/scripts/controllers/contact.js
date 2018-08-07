app.controller('ContactCtrl', ['$scope', function ($scope) {
	var mapProp = {
    	center: new google.maps.LatLng(-17.9673131,-67.1092741),
	    zoom:19,
    	mapTypeId:google.maps.MapTypeId.ROADMAP
  	};

	var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
	
	google.maps.event.addDomListener(window, 'load');


}]);