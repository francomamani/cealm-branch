app.factory('Control', ["$rootScope", "$location", "ROLES", function($rootScope, $location, ROLES){
return {
	update: function  (role) {
		role_current_user = role;
		$rootScope.$on('$routeChangeSuccess', function (event, next) {
        if (next.data !== undefined) {
            if(next.data.authorized.indexOf(parseInt(role_current_user)) !== -1){
				console.log(role_current_user);
			}
			else{				
				if(role_current_user == 1)
				{
					$location.path(ROLES.ADMIN.PATH);
				}
				else if(role_current_user == 2)
				{
					$location.path(ROLES.ADMINISTRATIVO.PATH);
				}
				else if(role_current_user == 3)
				{
					$location.path(ROLES.PROFESOR.PATH);
				}
				else if(role_current_user == 4)
				{
					$location.path(ROLES.ESTUDIANTE.PATH);

				}else if (role_current_user == 5) 
				{
					$location.path(ROLES.PUBLICO.PATH);

				}else if (role_current_user == 0) 
				{
					$location.path(ROLES.CONTROL.PATH);
				}				
			}
        }
    	});
	}

}}]);