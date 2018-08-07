<?php

class TeacherController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		$teachers = User::join('teachers','teachers.user_id', '=', 'users.id')->orderBy('users.lastname', 'asc')->get(['teachers.*', 'users.lastname', 'users.firstname','users.cellphone']);
		return Response::json($teachers);
	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$input = Input::all();
		Teacher::create($input);
		return Response::json(array('success'=>"Profesor Registrado"));
	}


	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		return Response::json(Teacher::find($id));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$teacher = Teacher::find($id);
		$teacher->type = Input::get('type');
		$teacher->field_of_study = Input::get('field_of_study');
		$teacher->save();
		return Response::json(array('success'=>'Informacion de profesor actualizada'));
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{

		$teacher = Teacher::find($id);
		$teacher->delete();
		return Response::json(array('success' => 'Profesor eliminado existosamente'));		
	}
}
