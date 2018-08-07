<?php

class AuthenticationController extends \BaseController {
	

	public function updatePassword(){
/*		$current_password = Input::get("current_password"); 
		$new_password = Input::get("new_password"); 
		$retype_new_password = Input::get("retype_new_password"); 
		*/
		$rules = array(
			'new_password' => 'required|min:5',
			'retype_new_password' => 'required|same:new_password'		
		);
/*		 $messages = array(
        	'required' => 'The :attribute is really really really important.',
        	'same'  => 'The :others must match.'
    	);*/
		 $messages = array(
		 	'min' => 'La nueva contraseña debe contener al menos 5 caracteres', 
		 	'same' => 'Este campo debe ser igual que la nueva contraseña' 
		 );
		$validator = Validator::make(Input::all(), $rules, $messages);

		if ($validator->fails()) {
//			var_dump($validator->messages());
			return Response::json($validator->messages());
//			return Response::json(array('error' => "Reingrese la nueva contrasenia")); 
		}else{
			$data = array();
			try {
				if (!Hash::check(Input::get("current_password"), Auth::user()->password))
					throw new Exception("La contraseña es incorrecta");
				$user = Auth::user();
				$user->password = Hash::make(Input::get("new_password"));
				$user->save();
				$data["success"] = "Contraseña actualizada :)";
				return Response::json($data);

			} catch (Exception $e) {
				$data["error"] = $e->getMessage();
				return Response::json($data);
			}
 
		}



	}
	public function postLogin()
	{
		try {
			$s = array(
				'username' => Input::get('username'), 
				'password' => Input::get('password')
			);		

			if (!Auth::attempt($s)) 
				throw new Exception("Cuenta o Contraseña incorrectas ");

			$data = array(
				"success" => "Enhorabuena iniciaste sesion"
			);
			$user = Auth::user();
			return Response::json($user);
		} catch (Exception $e) {
			Auth::logout();
			$data = array(
				"error" => $e->getMessage()
			);

			return Response::json($data);

		}
	}

	public function postLogout(){
		Auth::logout();
//		return Response::json(array("success"=> "acaba de cerrar sesion"));
//		return Redirect::to('/salir');
	}
	public function registerStudent()
	{
		$rules = array(
			'username' => 'required',
			'firstname' => 'required',
			'lastname' => 'required',
		);
		$validator = Validator::make(Input::all(), $rules);
		if ($validator->fails()) {
			return Response::json(array('error' => "Revise sus datos")); 
		}else{
			$users = User::where('username', Input::get('username'))->count();
			if ($users == 0) {
				$user = new User;
				$user->firstname = Input::get('firstname');
				$user->lastname = Input::get('lastname');
				$user->email = Input::get('email');
				$user->birthday = Input::get('birthday');
				$user->gender = Input::get('gender');
				$user->phone = Input::get('phone');
				$user->cellphone = Input::get('cellphone');
				$user->address = Input::get('address');
				$user->identity_card = Input::get('identity_card');
				$user->occupation = Input::get('occupation');
				$user->contact_person = Input::get('contact_person');
				$user->contact_person_phone = Input::get('contact_person_phone');
				$user->contact_person_cellphone = Input::get('contact_person_cellphone');

				$user->username = Input::get('username');
				$user->password = Hash::make(Input::get('identity_card_number'));
				$user->save();
				$roleInformation = array(
					"user_id" =>  $user->id,
					"type" =>  Input::get('type'),
					"level" => Input::get('level')					
				);
				Student::create($roleInformation);
				return Response::json(array("success" => "Registro exitoso :)")); 
			}else{
				return Response::json(array("error" => "La cuenta de usuario ya existe")); 				
			}
		}
	}
	public function registerTeacher()
	{
		$rules = array(
			'username' => 'required',
			'firstname' => 'required',
			'lastname' => 'required'
		);
		$validator = Validator::make(Input::all(), $rules);
		if ($validator->fails()) {
			return Response::json(array('error' => "Revise sus datos")); 
		}else{
			$users = User::where('username', Input::get('username'))->count();
			if ($users == 0) {
				$user = new User;
				$user->firstname = Input::get('firstname');
				$user->lastname = Input::get('lastname');
				$user->email = Input::get('email');
				$user->birthday = Input::get('birthday');
				$user->gender = Input::get('gender');
				$user->phone = Input::get('phone');
				$user->cellphone = Input::get('cellphone');
				$user->address = Input::get('address');
				$user->identity_card = Input::get('identity_card');
				$user->occupation = Input::get('occupation');
				$user->contact_person = Input::get('contact_person');
				$user->contact_person_phone = Input::get('contact_person_phone');
				$user->contact_person_cellphone = Input::get('contact_person_cellphone');

				$user->username = Input::get('username');
				$user->password = Hash::make(Input::get('identity_card_number'));
				$user->save();
				$roleInformation = array(
					"user_id" =>  $user->id,
					"type" =>  Input::get('type'),
					"field_of_study" => Input::get('field_of_study')
				);
				Teacher::create($roleInformation);
				return Response::json(array("success" => "Registro exitoso :)")); 
			}else{
				return Response::json(array("error" => "La cuenta de usuario ya existe")); 				
			}
		}
	}	

	public function postRegister()
	{
		$rules = array(
			'username' => 'required',
			'firstname' => 'required',
			'lastname' => 'required',
		);
		
		$validator = Validator::make(Input::all(), $rules);
		if ($validator->fails()) {
			return Response::json(array('error' => "Revise sus datos")); 
		}else{
			$users = User::where('username', Input::get('username'))->count();
			if ($users == 0) {
				$user = new User;
				$user->firstname = Input::get('firstname');
				$user->lastname = Input::get('lastname');
				$user->email = Input::get('email');
				$user->birthday = Input::get('birthday');
				$user->gender = Input::get('gender');
				$user->phone = Input::get('phone');
				$user->cellphone = Input::get('cellphone');
				$user->address = Input::get('address');
				$user->identity_card = Input::get('identity_card');
				$user->occupation = Input::get('occupation');
				$user->contact_person = Input::get('contact_person');
				$user->contact_person_phone = Input::get('contact_person_phone');
				$user->contact_person_cellphone = Input::get('contact_person_cellphone');
				$user->username = Input::get('username');
				$user->password = Hash::make(Input::get('identity_card_number'));
				$user->save();
				return Response::json(array("success" => "Registro exitoso :)")); 
			}else{
				return Response::json(array("error" => "La cuenta de usuario ya existe")); 				
			}
		}
	}

	public function getRoles()
	{
		$user = Auth::user();
		if ($user) {
			$student = Student::where('user_id', $user->id)->count();
			$teacher = Teacher::where('user_id', $user->id)->count();
			$administrative = Administrative::where('user_id', $user->id)->count();
			$administrator = Administrator::where('user_id', $user->id)->count();
			$control = Control::where('user_id', $user->id)->count();

			$data = array(
				'num_roles' => 0, 
				'data' => array()
			);
			if ($student>0){
				$data['num_roles']++;
				array_push($data['data'], array('role_id' => 4, 'role' => 'Estudiante'));
			}
			if ($teacher>0){
				$data['num_roles']++;
				array_push($data['data'], array('role_id' => 3, 'role' => 'Docente'));
			}
			if ($administrative>0){
				$data['num_roles']++;
				array_push($data['data'], array('role_id' => 2, 'role' => 'Administrativo'));
			}
			if ($administrator>0){
				$data['num_roles']++;
				array_push($data['data'], array('role_id' => 1, 'role' => 'Administrador'));
			}
			if ($control>0){
				$data['num_roles']++;
				array_push($data['data'], array('role_id' => 0, 'role' => 'Control'));
			}
			return Response::json($data);
		}else{
			return Response::json(array());
		}
	}

}
