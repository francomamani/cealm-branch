	<form action="login" method="post" class="login">
		<fieldset>
			<h3 class="title">Iniciar Sesión</h3>
			<div class="logo"></div>
			<p>
    			{{ $errors->first('email') }}
    			{{ $errors->first('password') }}
			</p>
			<p>
				{{{ $account_created or '' }}}
			</p>
			<div>
				<label for="email"></label>
				<input type="email" name="email" placeholder="Correo Electrónico" required autofocus>
			</div>
			<div>
				<label for="password"></label>
				<input type="password" name="password" placeholder="Contraseña" required>
			</div>
			<div><button type="submit">Iniciar Sesión</button></div>
		</fieldset>
	</form>