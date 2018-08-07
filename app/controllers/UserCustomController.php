<?php 
/**
* 
*/
class UserCustomController extends \BaseController
{
	public function updateRole()
	{
		$data = array();
		try {
			$user = User::find(Input::get('id'));
			if (!$user) 
				throw new Exception("El usuario no existe");

			$user->role = Input::get('role');
			$user->save();
			$data["success"] = "Enhorabuena actualizaste su rol";
			return Response::json($data); 

		} catch (Exception $e) {	
		$data["error"] = $e->getMessage();				
			return Response::json($data); 
		}

	}	

	public function searchUsers()
	{
		$value = Input::get("value");
		$users = User::where(function ($query) use ($value){
		    $query->orWhere('firstname', 'like', '%'.$value.'%');
		    $query->orWhere('lastname', 'like', '%'.$value.'%');
		    $query->orWhere('email', 'like', '%'.$value.'%');
		    $query->orWhere('gender', 'like', '%'.$value.'%');
		    $query->orWhere('phone', 'like', '%'.$value.'%');
		    $query->orWhere('cellphone', 'like', '%'.$value.'%');
		    $query->orWhere('address', 'like', '%'.$value.'%');
		    $query->orWhere('identity_card', 'like', '%'.$value.'%');
		    $query->orWhere('occupation', 'like', '%'.$value.'%');
		    $query->orWhere('contact_person', 'like', '%'.$value.'%');
		    $query->orWhere('contact_person_phone', 'like', '%'.$value.'%');
		    $query->orWhere('contact_person_cellphone', 'like', '%'.$value.'%');
		    $query->orWhere('username', 'like', '%'.$value.'%');
		})->orderBy('lastname', 'asc')->get();

		if (count($users) != 0) {
			return Response::json($users);
		}else{
			return Response::json(array(
				'error' => 'No se encontraron coincidencias'
			));			
		}
	}

	
	public function getUserRoles($id)
	{
		$student = Student::where('user_id', $id)->count();
		$teacher = Teacher::where('user_id', $id)->count();
		$administrative = Administrative::where('user_id', $id)->count();
		$administrator = Administrator::where('user_id', $id)->count();
		$control = Control::where('user_id', $id)->count();

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
	}
	public function assignRoles()
	{
		$role_id = Input::get('role_id');
		switch ($role_id) {
			case 0:
				if (Control::where('user_id', Input::get('user_id'))->count() == 0) {
					$control = new Control;
					$control->user_id = Input::get('user_id'); 
					$control->save();
				}else{
					return Response::json(array('error'=> 'El usuario ya tiene este rol asociado'));
				}
			break;
			case 1:
				if (Administrator::where('user_id', Input::get('user_id'))->count() == 0) {
					$administrator = new Administrator;
					$administrator->user_id = Input::get('user_id'); 
					$administrator->save();
				}else{
					return Response::json(array('error'=> 'El usuario ya tiene este rol asociado'));
				}
			break;
			case 2:
				if (Administrative::where('user_id', Input::get('user_id'))->count() == 0) {
					$administrative = new Administrative;
					$administrative->user_id = Input::get('user_id');
					$administrative->save();
				}else{
					return Response::json(array('error'=> 'El usuario ya tiene este rol asociado'));					
				}
			break;
			case 3:
				if (Teacher::where('user_id', Input::get('user_id'))->count() == 0) {
					$teacher = new Teacher;
					$teacher->user_id = Input::get('user_id');
					$teacher->type =  Input::get('type');
					$teacher->save();
				}else{
					return Response::json(array('error'=> 'El usuario ya tiene este rol asociado'));				
				}
			break;
			case 4:
				if (Student::where('user_id', Input::get('user_id'))->count() == 0) {
					$student = new Student;
					$student->user_id = Input::get('user_id');
					$student->type = Input::get('type');
					$student->level = Input::get('level');
					$student->save();  
				}else{
					return Response::json(array('error'=> 'El usuario ya tiene este rol asociado'));					
				}
			break;
			case 5:
				if (Control::where('user_id', Input::get('user_id'))->count() == 0) {
					$control = new Control;
					$control->user_id = Input::get('user_id');
					$control->save();					
				}else{
					return Response::json(array('error'=> 'El usuario ya tiene este rol asociado'));					
				}
			break;
		}
		return Response::json(array('success'=>'Rol asignado'));
	}
	public function currentTeacher()
	{
		if ($user = Auth::user()) {
			return Response::json(Teacher::where('user_id', $user->id)->firstOrFail());
		}else{
			return Response::json(array());
		}
	}
	public function resetPassword()
	{
		$user = User::find(Input::get('user_id'));
		$user->password = Hash::make(Input::get('reset'));
		$user->save();
		return Response::json(array('success' => 'Contraseña Restaurada'));
	}

}
?>