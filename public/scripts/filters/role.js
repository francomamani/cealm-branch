app.filter('role', function () {
	return function (text) {
		if (text != null) {
			switch(text){
				case "1": return "Administrador General"; break;
				case "2": return "Administrativo"; break;
				case "3": return "Profesor"; break;
				case "4": return "Estudiante"; break;
				case "5": return "Publico"; break;
			}
		};
	}
});

app.filter('program', function () {
	return function (text) {
		if (text != null) {
			switch(text){
				case "tecnico_medio": return "Técnico Medio"; break;
				case "tecnico_superior": return "Técnico Superior"; break;
				case "capacitacion": return "Capacitación"; break;
			}
		};
	}
});

app.filter('academic_degree', function () {
	return function (text) {
		if (text != null) {
			switch(text){
				case "capacitacion": return "Cap."; break;
				case "tecnico_medio": return "Tec.Med."; break;
				case "tecnico_superior": return "Tec.Sup."; break;
				case "licenciatura": return "Lic."; break;
				case "diplomado": return "Dipl."; break;
				case "especialidad": return "Esp."; break;
				case "maestria": return "M.Sc."; break;
				case "doctorado": return "Ph.D."; break;
			}
		};
	}
});

app.filter('bimester', function () {
	return function (text) {
		if (text != null) {
			switch(text){
				case 1: return "Primer Bimestre"; break;
				case 2: return "Segundo Bimestre"; break;
				case 3: return "Tercer Bimestre"; break;
				case 4: return "Cuarto Bimestre"; break;
				case 5: return "Quinto Bimestre"; break;
				case 6: return "Sexto Bimestre"; break;
				case 7: return "Septimo Bimestre"; break;
				case 8: return "Octavo Bimestre"; break;
				case 9: return "Noveno Bimestre"; break;
				case 10: return "Décimo Bimestre"; break;
				case 11: return "Décimo Primer Bimestre"; break;
				case 12: return "Décimo Segundo Bimestre"; break;
				case 13: return "Décimo Tercero Bimestre"; break;
				case 14: return "Décimo Cuarto Bimestre"; break;
				case 15: return "Décimo Quinto Bimestre"; break;
				case 16: return "Décimo Sexto Bimestre"; break;
				case 17: return "Décimo Septimo Bimestre"; break;
				case 18: return "Décimo Octavo Bimestre"; break;
			}
		};
	}
});