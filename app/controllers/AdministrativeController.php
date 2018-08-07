<?php

class AdministrativeController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return Response::json(Administrative::all());
/*		$users = array();
		$administratives = Administrative::all();
		foreach ($administratives as $administrative) {
			$user = User::find($administrative['attributes']['user_id']);
			array_push($users, $user['attributes']);
		}
		return Response::json($users);*/
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
		Administrative::create(Input::all());
		return Response::json(array('success'=>'Administrativo registrado'));
	}


	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		return Response::json(Administrative::find($id));
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
/*		$administrative = Administrative::find($id);
		$administrative->birthday = Input::get('birthday');
		$administrative->gender = Input::get('gender');
		$administrative->phone = Input::get('phone');
		$administrative->cellphone = Input::get('cellphone');
		$administrative->address = Input::get('address');
		$administrative->identity_card = Input::get('identity_card');
		$administrative->occupation = Input::get('occupation');
		$administrative->contact_person = Input::get('contact_person');
		$administrative->contact_person_phone = Input::get('contact_person_phone');
		$administrative->contact_person_cellphone = Input::get('contact_person_cellphone');
		$administrative->save();
		return Response::json(array('Administrativo actualizado'));*/

	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$administrative = Administrative::find($id);
		$administrative->delete();
		return Response::json(array('success'=>'Administrativo Eliminado'));
	}


}
