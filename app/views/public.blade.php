<!DOCTYPE html>
<html lang="es-BO">
<head>
	<meta charset="UTF-8">
	<title>INSTITUTO CEALM</title>
	<link rel="stylesheet" href="./styles/template.css">
	<link rel="stylesheet" href="./bower_components/bootstrap/dist/css/bootstrap-cosmo.min.css"/>
	<link rel="stylesheet" type="text/css" href="./bower_components/font-awesome/css/font-awesome.min.css">
<!-- 	
<link rel="stylesheet" href="https://bootswatch.com/spacelab/bootstrap.min.css"/> -->
	<link rel="stylesheet" href="./styles/animate.css">
	<link rel="stylesheet" href="./styles/components.css">
	<link rel="stylesheet" href="./styles/boot-components.css">

<!-- 	<link rel="stylesheet" href="./styles/animations.css"> -->
	<link rel="stylesheet" href="./bower_components/toastr/toastr.min.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/jquery.slick/1.5.7/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/jquery.slick/1.5.8/slick-theme.css"/>
<link rel="stylesheet" href="./bower_components/angular-bootstrap/ui-bootstrap-csp.css"/>
<link rel="stylesheet" href="./bower_components/jq-timeTo/dist/timeTo.css"/>

<!-- datepicker -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker.min.css"/>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker.standalone.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.min.css"> -->
<!-- end datepicker -->
<link rel="stylesheet" href="./bower_components/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css"/>
<link rel="stylesheet" href="./bower_components/owl-carousel/owl-carousel/owl.carousel.css">
<link rel="stylesheet" href="./bower_components/owl-carousel/owl-carousel/owl.theme.css">
<link rel="stylesheet" href="./bower_components/owl-carousel/owl-carousel/owl.transitions.css">

<link rel="stylesheet" href="./bower_components/bootstrap-switch/dist/css/bootstrap3/bootstrap-switch.min.css">
<!-- 	
	<link rel="stylesheet" href="./bower_components/angular-material/angular-material.min.css">
<link rel="stylesheet" href="./styles/auth.css">
<link rel="stylesheet" href="./bower_components/ngDialog/css/ngDialog.min.css"/>
 -->
<!-- 	
	 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <base href="/" />
	<script async defer
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDXbMZZIGcIY2jMUA9qIUPrQ7kXC5GucSk">
	</script>

</head>
<body ng-app="cealmApp" ng-controller="MainCtrl">
	<div ng-view></div>

	<!--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDXbMZZIGcIY2jMUA9qIUPrQ7kXC5GucSk"></script> -->
	<script src="./bower_components/jquery/dist/jquery.min.js"></script>
	<script src="./bower_components/jq-timeTo/dist/jquery.timeTo.min.js"></script>

	<script src="./bower_components/toastr/toastr.min.js"></script>

	<script src="./bower_components/angular/angular.min.js"></script>
	<script src="./bower_components/angular-animate/angular-animate.min.js"></script>
	<script src="./bower_components/angular-aria/angular-aria.min.js"></script>
	<script src="./bower_components/angular-material/angular-material.min.js"></script>
	
	<script src="./bower_components/angular-route/angular-route.min.js"></script>
	<script src="./bower_components/angular-cookies/angular-cookies.min.js"></script>
	<script src="./bower_components/angular-resource/angular-resource.min.js"></script>


	<script src="./bower_components/lodash/lodash.min.js"></script>
	<script src="./bower_components/restangular/dist/restangular.min.js"></script>

	<script src="./bower_components/ngDialog/js/ngDialog.min.js"></script>
	<!-- moments -->
	<!-- end moments -->
	<!-- bootstrap -->
	<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="./bower_components/bootstrap/js/transition.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
	
	<script src="./bower_components/moment/min/moment-with-locales.min.js"></script>
	<script src="./bower_components/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
	<!-- end bootstrap -->

	<script src="./bower_components/ng-file-upload/ng-file-upload-shim.min.js"></script> 
	<script src="./bower_components/ng-file-upload/ng-file-upload.min.js"></script>
	<script src="./bower_components/angular-bootstrap/ui-bootstrap-tpls-0.13.0.js"></script>

	<!-- so important -->

	<script src="./bower_components/jspdf/jspdf.js"></script>
	<script src="./bower_components/jspdf/dist/jspdf.debug.js"></script>
	<script src="./bower_components/jspdf/plugins/standard_fonts_metrics.js"></script>
	<script src="./bower_components/jspdf/plugins/from_html.js"></script>
	<script src="./bower_components/jspdf/plugins/split_text_to_size.js"></script>


	<script src="./bower_components/jspdf/plugins/split_text_to_size.js"></script>
	<script src="./bower_components/jspdf/plugins/from_html.js"></script>
	<script src="./bower_components/jspdf/plugins/autotable.js"></script>
	<script src="./bower_components/angucomplete-alt/dist/angucomplete-alt.min.js"></script>
	
	<script src="./bower_components/owl-carousel/owl-carousel/owl.carousel.min.js"></script>

	<script src="./bower_components/file-saver.js/FileSaver.js"></script>
	<script src="./bower_components/ng-table-to-csv/dist/ng-table-to-csv.min.js"></script>

	<script src="./bower_components/bootstrap-switch/dist/js/bootstrap-switch.js"></script>



	<!-- scripts -->
<!-- <script src="https://rawgithub.com/eligrey/FileSaver.js/master/FileSaver.js" type="text/javascript"></script> -->

<!-- <script src="./bower_components/blob-polyfill/Blob.js"></script>
<script src="./bower_components/file-saver/FileSaver.js"></script> -->


	<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-i18n/1.4.6/angular-locale_es-bo.min.js"></script>

	<script type="text/javascript" src="//cdn.jsdelivr.net/jquery.slick/1.5.7/slick.min.js"></script>

	<script src="./scripts/app.js"></script>

	<script src="./scripts/services/auth.js"></script>
	<script src="./scripts/services/control.js"></script>
	<script src="./scripts/services/book.js"></script>
	<script src="./scripts/services/user.js"></script>
	<script src="./scripts/services/product.js"></script>
	<script src="./scripts/services/student.js"></script>
	<script src="./scripts/services/teacher.js"></script>
	<script src="./scripts/services/calendar.js"></script>
	<script src="./scripts/services/pensum.js"></script>
	<script src="./scripts/services/subject.js"></script>
	<script src="./scripts/services/plan.js"></script>
	<script src="./scripts/services/bimester.js"></script>
	<script src="./scripts/services/reports.js"></script>

	<script src="./scripts/services/currency.js"></script>

	<script src="./scripts/directives/pagination.js"></script>
	<script src="./scripts/directives/ngenter.js"></script>
	


	<script src="./scripts/filters/role.js"></script>
	<script src="./scripts/filters/calendar.js"></script>
	<script src="./scripts/filters/control.js"></script>
	
	<script src="./scripts/controllers/components/navbar.js"></script>
	<script src="./scripts/controllers/components/teacher-navbar.js"></script>

	<script src="./scripts/controllers/logout.js"></script>
	<script src="./scripts/controllers/main.js"></script>
	<script src="./scripts/controllers/role.js"></script>

	<script src="./scripts/controllers/control.js"></script>
	<script src="./scripts/controllers/admin.js"></script>
	<script src="./scripts/controllers/administrative.js"></script>
	<script src="./scripts/controllers/teacher.js"></script>
	<script src="./scripts/controllers/student.js"></script>
	<script src="./scripts/controllers/public.js"></script>

	<script src="./scripts/controllers/profile.js"></script>
	<script src="./scripts/controllers/password.js"></script>
	<script src="./scripts/controllers/caja.js"></script>
	<script src="./scripts/controllers/membership.js"></script>

	<script src="./scripts/controllers/users.js"></script>
	<script src="./scripts/controllers/products.js"></script>
	<script src="./scripts/controllers/services.js"></script>
	<script src="./scripts/controllers/product.js"></script>
	<script src="./scripts/controllers/contact.js"></script>
	<script src="./scripts/controllers/changerole.js"></script>
	<script src="./scripts/controllers/pensum.js"></script>
	<script src="./scripts/controllers/pensumstructure.js"></script>
	<script src="./scripts/controllers/planes.js"></script>
	<script src="./scripts/controllers/recepcionplanes.js"></script>
	<script src="./scripts/controllers/pensumlist.js"></script>
	<script src="./scripts/controllers/recordbimester.js"></script>
	<script src="./scripts/controllers/recordroom.js"></script>
	<script src="./scripts/controllers/enableparallel.js"></script>
	<script src="./scripts/controllers/assignroles.js"></script>
	<script src="./scripts/controllers/assignschedules.js"></script>
	<script src="./scripts/controllers/careerregistration.js"></script>
	<script src="./scripts/controllers/subjectrecord.js"></script>
	<script src="./scripts/controllers/studentlist.js"></script>
	<script src="./scripts/controllers/highpraise.js"></script>
	<script src="./scripts/controllers/languagerecord.js"></script>
	<script src="./scripts/controllers/recordprices.js"></script>
	<script src="./scripts/controllers/website.js"></script>

	<script src="./scripts/controllers/documentreception.js"></script>

	<script src="./scripts/controllers/coverimages.js"></script>
	<script src="./scripts/controllers/payingstudents.js"></script>
	<script src="./scripts/controllers/recordstudent.js"></script>
	<script src="./scripts/controllers/myacademicfollow.js"></script>
	<script src="./scripts/controllers/paymenttype.js"></script>
	<script src="./scripts/controllers/deposittype.js"></script>

	<script src="./scripts/controllers/payment.js"></script>

	<script src="./scripts/controllers/cealm.js"></script>
	<script src="./scripts/controllers/activities.js"></script>
	<script src="./scripts/controllers/statistics.js"></script>

	<script src="./scripts/controllers/bimestralscores.js"></script>

	<script src="./scripts/controllers/recordteacher.js"></script>
	<script src="./scripts/controllers/deposit.js"></script>

	<script src="./scripts/controllers/query.js"></script>
	<script src="./scripts/controllers/expense.js"></script>
	<script src="./scripts/controllers/balance.js"></script>

	<script src="./scripts/controllers/attendance.js"></script>
	
	<script src="./scripts/controllers/widgets/confirm.js"></script>
	<script src="./scripts/controllers/widgets/updateproduct.js"></script>
	<script src="./scripts/controllers/widgets/productinfo.js"></script>
	<script src="./scripts/controllers/widgets/updateroom.js"></script>
	<script src="./scripts/controllers/widgets/recordschedule.js"></script>
	<script src="./scripts/controllers/widgets/updatebimester.js"></script>
	<script src="./scripts/controllers/widgets/updateprice.js"></script>
	<script src="./scripts/controllers/widgets/addscore.js"></script>
	<script src="./scripts/controllers/widgets/addexamtype.js"></script>
	<script src="./scripts/controllers/widgets/addcategorymark.js"></script>
	<script src="./scripts/controllers/widgets/recordyear.js"></script>
	<script src="./scripts/controllers/widgets/paytuition.js"></script>
	<script src="./scripts/controllers/widgets/paymentitem.js"></script>
	<script src="./scripts/controllers/widgets/createdeposit.js"></script>
	<script src="./scripts/controllers/widgets/createpayment.js"></script>
	<script src="./scripts/controllers/widgets/createdeposititem.js"></script>
	<script src="./scripts/controllers/widgets/monthlyopening.js"></script>

	<script src="./scripts/controllers/widgets/updateuser.js"></script>
	
	<script src="./scripts/controllers/widgets/renderscores.js"></script>

	<!-- students -->	
	<script src="./scripts/controllers/students/studentsignup.js"></script>


	<!-- teachers -->
	<script src="./scripts/controllers/teachers/teachersignup.js"></script>
	<script src="./scripts/controllers/teachers/mycourses.js"></script>
	<script src="./scripts/controllers/teachers/scores.js"></script>


	<script src="./scripts/controllers/certifications.js"></script>


	<div id="fb-root"></div>
	<script>
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) return;
		js = d.createElement(s); js.id = id;
		js.src = "//connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v2.3&appId=665982013502099";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	</script>
</body>
</html>