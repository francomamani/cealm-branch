<?php

class UserController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
//		return Response::json(User::paginate(5));
		return Response::json(User::all());
	}


	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		User::create(Input::all());
		return Response::json(array('success'=>'Usuario creado exitosamente'));
	}


	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		return Response::json(User::find($id));
	}


	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		//
	}


	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$user = User::find($id);
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
		$user->save();
		return Response::json($user);
/*		return Response::json(array('success'=>'Usuario actualizado'));*/
/*		$data = array();
		try {
			$user = User::find($id);
			if (!$user) 
				throw new Exception("El usuario no existe");

			$user->firstname = Input::get('firstname');
			$user->lastname = Input::get('lastname');
			$user->email = Input::get('email');
			$user->cellphone = Input::get('cellphone');
			$user->address = Input::get('address');
			$user->save();
			$data["success"] = "Enhorabuena actualizaste tu perfil";
			return Response::json($data); 

		} catch (Exception $e) {
			$data["error"] = $e->getMessage();				
			return Response::json($data); 
		}*/
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		User::find($id)->delete();		
		return Response::json(array(
			'success' => "Usuario eliminado"
		));
	}


}
