app.controller('ContactCtrl', ['$scope', function ($scope) {
/*
	var mapProp = {
    	center: new google.maps.LatLng(-17.9673131,-67.1092741),
	    zoom:19,
    	mapTypeId:google.maps.MapTypeId.ROADMAP
  	};

	var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
*/


	ubicacion = {lat: -17.9673131, lng: -67.1092741};
	map = new google.maps.Map(document.getElementById('googleMap'), {
		center: ubicacion,
		zoom: 19
	});
	var marker = new google.maps.Marker({position: ubicacion, map: map});


	google.maps.event.addDomListener(window, 'load');

/*<div id="map"></div>
		<script>
	var map;
	function initMap() {
		map = new google.maps.Map(document.getElementById('map'), {
			center: {lat: -34.397, lng: 150.644},
			zoom: 8
		});
	}
</script>
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap"
	async defer></script>*/

}]);