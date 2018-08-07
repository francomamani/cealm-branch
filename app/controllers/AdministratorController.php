<?php

class AdministratorController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return Response::json(Administrator::all());
		
/*		$users = array();
		$administrators = Administrator::all();
		foreach ($administrators as $administrator) {
			$user = User::find($administrator['attributes']['user_id']);
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
		Administrator::create(Input::all());
		return Response::json(array('success'=>'Administrador registrado'));
	}


	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		return Response::json(Administrator::find($id));
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
/*		$administrator = Administrator::find($id);
		$administrator->birthday = Input::get('birthday');
		$administrator->gender = Input::get('gender');
		$administrator->phone = Input::get('phone');
		$administrator->cellphone = Input::get('cellphone');
		$administrator->address = Input::get('address');
		$administrator->identity_card = Input::get('identity_card');
		$administrator->occupation = Input::get('occupation');
		$administrator->contact_person = Input::get('contact_person');
		$administrator->contact_person_phone = Input::get('contact_person_phone');
		$administrator->contact_person_cellphone = Input::get('contact_person_cellphone');
		$administrator->save();
		return Response::json(array('Administrador actualizado'));*/
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$administrator = Administrator::find($id);
		$administrator->delete();
		return Response::json(array('success'=>'Administrador eliminado'));
	}


}
