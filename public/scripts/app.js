var app = angular.module('cealmApp', 
	['ngRoute', 
	'ngAnimate', 
	'ngDialog', 
	'ngCookies',
	'restangular',
	'ngResource',
	'ui.bootstrap',
	'ngFileUpload', 
	'ngMaterial',
	'angucomplete-alt',
	'ngTableToCsv'
	]);

app.constant('ROLES', {
	CONTROL: {
		ROLE: 0, 
		PATH: "/control"
	},
	ADMIN: {
		ROLE: 1, 
		PATH: "/admin"
	},
	ADMINISTRATIVO: {
		ROLE: 2, 
		PATH: "/administrativo"
	}, 
	PROFESOR: {
		ROLE: 3, 
		PATH: "/profesor"
	}, 
	ESTUDIANTE: {
		ROLE: 4, 
		PATH: "/estudiante"
	}, 
	PUBLICO: {
		ROLE: 5,
		PATH: '/publico'
	}
});

app.config(['$routeProvider', 
	'$locationProvider', 
	'$mdThemingProvider',
	'RestangularProvider',
	'ROLES', function ($routeProvider, $locationProvider, $mdThemingProvider, RestangularProvider, ROLES) {

    $mdThemingProvider.theme('default')
      .primaryPalette('indigo')
      .backgroundPalette('grey');

	RestangularProvider.setBaseUrl('/api/v1');

	$routeProvider.
		when('/', {
			templateUrl: 'partials/public.html',
			controller: 'PublicCtrl',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).
		when('/cealm', {
			templateUrl: 'partials/cealm.html',
			controller: 'CealmCtrl',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).
		when('/autoridades', {
			templateUrl: 'partials/autoridades.html',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).
		when('/organigrama', {
			templateUrl: 'partials/organigrama.html',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).
        when('/titulacion', {
			templateUrl: 'partials/titulacion.html',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).
        when('/beneficios', {
			templateUrl: 'partials/beneficios.html',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).
        when('/equivalencias', {
			templateUrl: 'partials/equivalencias.html',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).
        when('/carreras', {
			templateUrl: 'partials/carreras.html',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).
        when('/horarios', {
			templateUrl: 'partials/horarios.html',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).
        when('/calendario', {
			templateUrl: 'partials/calendario.html',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).
        when('/teachers-training', {
			templateUrl: 'partials/teachers-training.html',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).
        when('/examenes-oficiales', {
			templateUrl: 'partials/examenes-oficiales.html',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).
        when('/cursos-especiales', {
			templateUrl: 'partials/cursos-especiales.html',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).
        when('/cursos-de-capacitacion', {
			templateUrl: 'partials/cursos-de-capacitacion.html',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).
        when('/cursos-de-nivelacion', {
			templateUrl: 'partials/cursos-de-nivelacion.html',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).
        when('/traducciones', {
			templateUrl: 'partials/traducciones.html',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).
        when('/planta-docente', {
			templateUrl: 'partials/plantadocente.html',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).
        when('/nacimiento-institucion', {
			templateUrl: 'partials/institution.html',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).
		when('/mision', {
			templateUrl: 'partials/mission.html',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).				
		when('/vision', {
			templateUrl: 'partials/vision.html',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).				
		when('/valores', {
			templateUrl: 'partials/values.html',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).						
		when('/actividades', {
			templateUrl: 'partials/activities.html',
			controller: 'ActivitiesCtrl',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).				
		when('/metodo', {
			templateUrl: 'partials/method.html',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).				
		when('/que-es-el-mcerl', {
			templateUrl: 'partials/whats_the_mcerl.html',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).				
		when('/por-que-el-mcerl', {
			templateUrl: 'partials/why_the_mcerl.html',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).				
		when('/competencias-linguisticas', {
			templateUrl: 'partials/language_skills.html',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).				
		when('/productos', {
			templateUrl: 'partials/products.html',
			controller: 'ProductsCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE, ROLES.ADMINISTRATIVO.ROLE, ROLES.ESTUDIANTE.ROLE, ROLES.PROFESOR.ROLE, ROLES.PUBLICO.ROLE]				
			}
		}).
		when('/servicios', {
			templateUrl: 'partials/services.html',
			controller: 'ServicesCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE, ROLES.ADMINISTRATIVO.ROLE, ROLES.ESTUDIANTE.ROLE, ROLES.PROFESOR.ROLE, ROLES.PUBLICO.ROLE]				
			}
		}).
		when('/contacto', {
			templateUrl: 'partials/contact.html',
			controller: 'ContactCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE, ROLES.ADMINISTRATIVO.ROLE, ROLES.ESTUDIANTE.ROLE, ROLES.PROFESOR.ROLE, ROLES.PUBLICO.ROLE]				
			}
		}).
		when('/login', {
			templateUrl: 'partials/login.html',
			controller: 'MainCtrl',
			data: {
				authorized: [ROLES.PUBLICO.ROLE]
			}
		}).
		when('/roles', {
			templateUrl: 'partials/roles.html',
			controller: 'RoleCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE, ROLES.ADMINISTRATIVO.ROLE, ROLES.ESTUDIANTE.ROLE, ROLES.PROFESOR.ROLE]
			}
		}).
		when('/logout', {
			templateUrl: 'partials/public.html',
			controller: 'LogoutCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE, ROLES.ADMINISTRATIVO.ROLE, ROLES.PROFESOR.ROLE, ROLES.ESTUDIANTE.ROLE]				
			}
		}).
		when('/control', {
			templateUrl: 'partials/control.html',
			controller: 'ControlCtrl',
			data: {
				authorized: [ROLES.CONTROL.ROLE]
			}
		}).
		when('/admin', {
			templateUrl: 'partials/admin.html',
			controller: 'AdminCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]
			}
		}).
		when('/admin/perfil', {
			templateUrl: 'partials/profile.html',
			controller: 'ProfileCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]
			}
		}).
		when('/admin/productos', {
			templateUrl: 'partials/product.html',
			controller: 'ProductCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]				
			}
		}).
		when('/admin/membresia', {
			templateUrl: 'partials/membership.html',
			controller: 'MembershipCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]				
			}
		}).
		when('/admin/usuarios', {
			templateUrl: 'partials/users.html',
			controller: 'UsersCtrl', 
			data: {
				authorized: [ROLES.ADMIN.ROLE]
			}
		}).
		when('/admin/password', {
			templateUrl: 'partials/password.html',
			controller: 'PasswordCtrl', 
			data: {
				authorized: [ROLES.ADMIN.ROLE]
			}
		}).		
		when('/admin/caja', {
			templateUrl: 'partials/caja.html',
			controller: 'CajaCtrl', 
			data: {
				authorized: [ROLES.ADMIN.ROLE]
			}
		}).
		when('/admin/registrar-bimestre', {
			templateUrl: 'partials/recordbimester.html',
			controller: 'RecordBimesterCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]
			}
		}).			
		when('/admin/registrar-aula', {
			templateUrl: 'partials/recordroom.html',
			controller: 'RecordRoomCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]
			}
		}).			
		when('/admin/habilitar-paralelos', {
			templateUrl: 'partials/enableparallel.html',
			controller: 'EnableParallelCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]
			}
		}).
		when('/admin/lista-pensums', {
			templateUrl: 'partials/pensumlist.html',
			controller: 'PensumListCtrl', 
			data: {
				authorized: [ROLES.ADMIN.ROLE]
			}
		}).		
		when('/admin/registro-materias', {
			templateUrl: 'partials/subjectrecord.html',
			controller: 'SubjectRecordCtrl', 
			data: {
				authorized: [ROLES.ADMIN.ROLE]
			}
		}).
		when('/admin/imagenes-portada', {
			templateUrl: 'partials/coverimages.html',
			controller: 'CoverImagesCtrl', 
			data: {
				authorized: [ROLES.ADMIN.ROLE]
			}
		}).					
		when('/admin/pagina-web', {
			templateUrl: 'partials/website.html',
			controller: 'WebSiteCtrl', 
			data: {
				authorized: [ROLES.ADMIN.ROLE]
			}
		}).
		when('/admin/signup', {
			templateUrl: 'partials/signup.html',
			controller: 'MainCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]
			}
		}).
		when('/admin/asignar_roles', {
			templateUrl: 'partials/assignroles.html',
			controller: 'AssignRolesCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]
			}
		}).		
		when('/admin/registro-idioma', {
			templateUrl: 'partials/languagerecord.html',
			controller: 'LanguageRecordCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]
			}
		}).
		when('/admin/pensum', {
			templateUrl: 'partials/pensum.html',
			controller: 'PensumCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]
			}
		}).
		when('/admin/estructura-pensum', {
			templateUrl: 'partials/pensumstructure.html',
			controller: 'PensumStructureCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]
			}
		}).
		when('/admin/recepcion-planes', {
			templateUrl: 'partials/recepcionplanes.html',
			controller: 'RecepcionPlanesCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]
			}
		}).		
		when('/admin/certificaciones', {
			templateUrl: 'partials/certifications.html',
			controller: 'CertificationsCtrl', 
			data: {
				authorized: [ROLES.ADMIN.ROLE]
			}
		}).				
/*		when('/admin/asignar-horarios', {
			templateUrl: 'partials/assignschedules.html',
			controller: 'AssignSchedulesCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]
			}
		}).*/
		when('/admin/inscripcion-carrera', {
			templateUrl: 'partials/careerregistration.html',
			controller: 'CareerRegistrationCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]
			}
		}).		
		when('/admin/lista-estudiantes', {
			templateUrl: 'partials/studentlist.html',
			controller: 'StudentListCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]
			}
		}).			
		when('/admin/estadisticas', {
			templateUrl: 'partials/statistics.html',
			controller: 'StatisticsCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]
			}
		}).							
		when('/admin/registro-precios', {
			templateUrl: 'partials/recordprices.html',
			controller: 'RecordPricesCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]
			}
		}).			
		when('/admin/pago-estudiantes', {
			templateUrl: 'partials/payingstudents.html',
			controller: 'PayingStudentsCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]				
			}
		}).		
		when('/admin/tipos-pago-terceros', {
			templateUrl: 'partials/paymentType.html',
			controller: 'PaymentTypeCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]				
			}
		}).		
		when('/admin/tipos-deposito', {
			templateUrl: 'partials/depositType.html',
			controller: 'DepositTypeCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]				
			}
		}).		
		when('/admin/tipos-pago-terceros', {
			templateUrl: 'partials/paymentType.html',
			controller: 'PaymentTypeCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]				
			}
		}).		
		when('/admin/tipos-deposito', {
			templateUrl: 'partials/depositType.html',
			controller: 'DepositTypeCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]				
			}
		}).		
		when('/admin/pagos', {
			templateUrl: 'partials/payment.html',
			controller: 'PaymentCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]				
			}
		}).		
		when('/admin/depositos', {
			templateUrl: 'partials/deposit.html',
			controller: 'DepositCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]				
			}
		}).		
		when('/admin/queries', {
			templateUrl: 'partials/queries.html',
			controller: 'QueryCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]				
			}
		}).	
		when('/admin/egresos', {
			templateUrl: 'partials/expenses.html',
			controller: 'ExpenseCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]				
			}
		}).			
		when('/admin/libro-de-cuentas', {
			templateUrl: 'partials/balance.html',
			controller: 'BalanceCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]				
			}
		}).	
		when('/admin/asistencias', {
			templateUrl: 'partials/attendances.html',
			controller: 'AttendanceCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]				
			}
		}).			
		when('/admin/recepcion-documentos', {
			templateUrl: 'partials/documentsreception.html',
			controller: 'DocumentReceptionCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]				
			}
		}).						
		when('/admin/apertura-mensual', {
			templateUrl: 'partials/monthlyopening.html',
			controller: 'MonthlyOpeningCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE]				
			}
		}).						
		when('/administrativo', {
			templateUrl: 'partials/administrative.html',
			controller: 'AdministrativeCtrl',
			data: {
				authorized: [ROLES.ADMIN.ROLE, ROLES.ADMINISTRATIVO.ROLE]
			}
		}).
		when('/administrativo/perfil', {
			templateUrl: 'partials/profile.html',
			controller: 'ProfileCtrl',
			data: {
				authorized: [ROLES.ADMINISTRATIVO.ROLE]
			}
		}).		
		when('/administrativo/password', {
			templateUrl: 'partials/password.html',
			controller: 'PasswordCtrl', 
			data: {
				authorized: [ROLES.ADMINISTRATIVO.ROLE]
			}
		}).		
		when('/administrativo/signup', {
			templateUrl: 'partials/signup.html',
			controller: 'MainCtrl', 
			data: {
				authorized: [ROLES.ADMINISTRATIVO.ROLE]
			}
		}).
		when('/administrativo/certificaciones', {
			templateUrl: 'partials/certifications.html',
			controller: 'CertificationsCtrl', 
			data: {
				authorized: [ROLES.ADMINISTRATIVO.ROLE]
			}
		}).				
		when('/administrativo/registrar-estudiante', {
			templateUrl: 'partials/recordstudent.html',
			controller: 'RecordStudentCtrl', 
			data: {
				authorized: [ROLES.ADMINISTRATIVO.ROLE]
			}
		}).				
		when('/administrativo/inscripcion-carrera', {
			templateUrl: 'partials/careerregistration.html',
			controller: 'CareerRegistrationCtrl',
			data: {
				authorized: [ROLES.ADMINISTRATIVO.ROLE]
			}
		}).		
		when('/administrativo/registro-materias', {
			templateUrl: 'partials/subjectrecord.html',
			controller: 'SubjectRecordCtrl', 
			data: {
				authorized: [ROLES.ADMINISTRATIVO.ROLE]
			}
		}).				
		when('/administrativo/membresia', {
			templateUrl: 'partials/membership.html',
			controller: 'MembershipCtrl',
			data: {
				authorized: [ROLES.ADMINISTRATIVO.ROLE]				
			}
		}).
		when('/administrativo/registro-estudiantes', {
			templateUrl: 'partials/students/studentsignup.html',
			controller: 'StudentSignupCtrl',
			data: {
				authorized: [ROLES.ADMINISTRATIVO.ROLE]				
			}
		}).
		when('/administrativo/pago-estudiantes', {
			templateUrl: 'partials/payingstudents.html',
			controller: 'PayingStudentsCtrl',
			data: {
				authorized: [ROLES.ADMINISTRATIVO.ROLE]				
			}
		}).		
		when('/administrativo/registro-precios', {
			templateUrl: 'partials/recordprices.html',
			controller: 'RecordPricesCtrl',
			data: {
				authorized: [ROLES.ADMINISTRATIVO.ROLE]
			}
		}).					
		when('/administrativo/habilitar-paralelos', {
			templateUrl: 'partials/enableparallel.html',
			controller: 'EnableParallelCtrl',
			data: {
				authorized: [ROLES.ADMINISTRATIVO.ROLE]
			}
		}).
		when('/administrativo/notas-bimestrales', {
			templateUrl: 'partials/bimestralscores.html',
			controller: 'BimestralScoresCtrl',
			data: {
				authorized: [ROLES.ADMINISTRATIVO.ROLE]
			}
		}).		
		when('/administrativo/estadisticas', {
			templateUrl: 'partials/statistics.html',
			controller: 'StatisticsCtrl',
			data: {
				authorized: [ROLES.ADMINISTRATIVO.ROLE]
			}
		}).							
		when('/administrativo/registrar-docente', {
			templateUrl: 'partials/recordteacher.html',
			controller: 'RecordTeacherCtrl',
			data: {
				authorized: [ROLES.ADMINISTRATIVO.ROLE]
			}
		}).									
		when('/profesor', {
			templateUrl: 'partials/teacher.html',
			controller: 'TeacherCtrl',
			data: {
				authorized: [ROLES.PROFESOR.ROLE]
			}
		}).
		when('/profesor/perfil', {
			templateUrl: 'partials/profile.html',
			controller: 'ProfileCtrl',
			data: {
				authorized: [ROLES.PROFESOR.ROLE]
			}
		}).
		when('/profesor/password', {
			templateUrl: 'partials/password.html',
			controller: 'PasswordCtrl', 
			data: {
				authorized: [ROLES.PROFESOR.ROLE]
			}
		}).		
		when('/profesor/mis-cursos', {
			templateUrl: 'partials/mycourses.html',
			controller: 'MyCoursesCtrl',
			data: {
				authorized: [ROLES.PROFESOR.ROLE]
			}
		}).
		when('/profesor/calificaciones', {
			templateUrl: 'partials/scores.html',
			controller: 'ScoresCtrl',
			data: {
				authorized: [ROLES.PROFESOR.ROLE]
			}
		}).
		when('/profesor/envio-planes', {
			templateUrl: 'partials/planes.html',
			controller: 'PlanesCtrl',
			data: {
				authorized: [ROLES.PROFESOR.ROLE]
			}
		}).
		when('/profesor/homeworks', {
			templateUrl: 'partials/homeworks.html',
			controller: 'HomeworksCtrl',
			data: {
				authorized: [ROLES.PROFESOR.ROLE]
			}
		}).
		when('/profesor/ponderaciones', {
			templateUrl: 'partials/highpraise.html',
			controller: 'HighPraiseCtrl',
			data: {
				authorized: [ROLES.PROFESOR.ROLE]
			}
		}).						
		when('/estudiante', {
			templateUrl: 'partials/student.html',
			controller: 'StudentCtrl',
			data: {
				authorized: [ROLES.ESTUDIANTE.ROLE]
			}
		}).
		when('/estudiante/seguimiento-academico', {
			templateUrl: 'partials/myacademicfollow.html',
			controller: 'MyAcademicFollowCtrl',
			data: {
				authorized: [ROLES.ESTUDIANTE.ROLE]
			}
		}).
/*		when('/estudiante/historial-academico', {
			templateUrl: 'partials/myAcademicHistorial.html',
			controller: 'Ctrl',
			data: {
				authorized: [ROLES.ESTUDIANTE.ROLE]
			}
		}).*/
		when('/estudiante/perfil', {
			templateUrl: 'partials/profile.html',
			controller: 'ProfileCtrl',
			data: {
				authorized: [ROLES.ESTUDIANTE.ROLE]
			}
		}).
		when('/estudiante/password', {
			templateUrl: 'partials/password.html',
			controller: 'PasswordCtrl', 
			data: {
				authorized: [ROLES.ESTUDIANTE.ROLE]
			}
		}).
		otherwise({ redirectTo: '/' })
		$locationProvider.html5Mode(true).hashPrefix("!");
}]);

app.run(function ($rootScope, $location, ROLES) {
	$rootScope.$on('$routeChangeStart', function (event, next, current) {
		var role = parseInt(localStorage.getItem('role'));
		var user = JSON.parse(localStorage.getItem('user'));
		if (user !== undefined) {
			if (next.data !== undefined) {
				if (user && localStorage.getItem('role') == null) {
					$location.path('roles');
				};
	            if(next.data.authorized.indexOf(role) !== -1){

				}else{
					switch(role){
						case 0: $location.path(ROLES.CONTROL.PATH); break;
						case 1: $location.path(ROLES.ADMIN.PATH);break;
						case 2: $location.path(ROLES.ADMINISTRATIVO.PATH);break;
						case 3: $location.path(ROLES.PROFESOR.PATH);break;
						case 4: $location.path(ROLES.ESTUDIANTE.PATH);break;
					}				
				}
			}else{
				$location.path('/');
			}
		}else{
			$location.path('/');			
		}
		/*end user*/
	});	
});