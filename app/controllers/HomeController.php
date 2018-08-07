p<?php

class HomeController extends BaseController {

	/*
	|--------------------------------------------------------------------------
	| Default Home Controller
	|--------------------------------------------------------------------------
	|
	| You may wish to use controllers instead of, or in addition to, Closure
	| based routes. That's great! Here is an example controller method to
	| get you started. To route to this controller, just add the route:
	|
	|	Route::get('/', 'HomeController@showWelcome');
	|
	*/

	public function showLogin()
	{
		return View::make('login');
	}

	public function showSignup()
	{
		return View::make('signup');
	}
	public function login()
	{
		# code...
	}

/*	public function postLogin()
	{
		// validate the info, create rules for the inputs
		$rules = array(
    		'email'    => 'required|email', // make sure the email is an actual email
   	 		'password' => 'required|alphaNum|min:3' // password can only be alphanumeric and has to be greater than 3 characters
		);

		$messages = array(
			'min'    => 'La contraseña debe tener al menos 3 caracterres'
		);

		// run the validation rules on the inputs from the form

		$validator = Validator::make(Input::all(), $rules, $messages);

		// if the validator fails, redirect back to the form
		if ($validator->fails()) {
    		return Redirect::to('login')
	        	->withErrors($validator) // send back all errors to the login form
    	    	->withInput(Input::except('password')); // send back the input (not the password) so that we can repopulate the form
		} else {
    		// create our user data for the authentication
    		$userdata = array(
       	 		'email'     => Input::get('email'),
				'password'  => Input::get('password')
    		);

	    	// attempt to do the login
			if (Auth::attempt($userdata)) {
        		// validation successful!
        		// redirect them to the secure section or whatever
        		// return Redirect::to('secure');
        		// for now we'll just echo success (even though echoing in a controller is bad)
				$user = DB::table('users')->where('role', 'admin')->first();
				switch ($user->role) {
					case 'admin':
						return View::make('admin');
						break;
					case 'employee':
						return View::make('employee');
						break;
					case 'client':
						return View::make('client');
						break;
					default:
						return View::make('public');
						break;
				}
    		} else {        
        		// validation not successful, send back to form 
        		return Redirect::to('login');
	    	}
		}
	}*/

	public function getLogout()
	{
		try {
			return Auth::logout();
		} catch (Exception $e) {
			return $e->getMessage();
		}
	}


	public function postSignup()	{

		$rules = array(
			'username' => 'required',
			'firstname' => 'required',
			'lastname' => 'required',
			'email' => 'required|email',
			'password' => 'required|min:5',
			'retype_password' => 'required|same:password', 
		);
		$validator = Validator::make(Input::all(), $rules);
		if ($validator->fails()) {
			return Redirect::to('signup')
					->withErrors($validator)
					->withInput(Input::except('password'));
		}else{

			$user = new User;
			$user->role = 'cliente';
			$user->username = Input::get('username');
			$user->firstname = Input::get('firstname');
			$user->lastname= Input::get('lastname');
			$user->email = Input::get('email');
			$user->password = Hash::make(Input::get('password'));
/*			$user->picture = "images/pictures/person.png";*/
			$user->save();

			return View::make('login')
					->with('account_created', 'Su cuenta fue creada exitosamente :)');
		}

	}
}