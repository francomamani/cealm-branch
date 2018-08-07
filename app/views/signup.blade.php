<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Registro</title>
	<link rel="stylesheet" href="./styles/auth.css">
</head>
<body>
	<form action="signup" method="post" class="login">
		<fieldset>
			<h3 class="title">Registro</h3>
<!-- 			<div class="logo">	</div> -->
<!-- 			<p>
    			{{ $errors->first('email') }}
    			{{ $errors->first('password') }}
</p> -->
			<div>
				<label for="username"></label>
				<input type="text" name="username" placeholder="Nombre de Cuenta" required autofocus>
			</div>
			<div>
				<label for="firstname"></label>
				<input type="text" name="firstname" placeholder="Nombres" required>
			</div>
			<div>
				<label for="lastname"></label>
				<input type="text" name="lastname" placeholder="Apellidos" required>
			</div>

			<div>
				<label for="email"></label>
				<input type="email" name="email" placeholder="Correo Electrónico" required>
			</div>
			<div>
				<label for="password"></label>
				<input type="password" name="password" placeholder="Contraseña" required>
			</div>
			<div>
				<label for="retype_password"></label>
				<input type="password" name="retype_password" placeholder="Confirmar Contraseña" required>
			</div>
			<div><button type="submit">Regístrate!</button></div>
		</fieldset>
	</form>
</body>
</html>