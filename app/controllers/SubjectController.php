<?php

class SubjectController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return Response::json(Subject::orderBy('subject_code', 'asc')->get());
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
		$data = Subject::create(array(
			'pensum_id' => Input::get('pensum_id'),
			'bimester' => Input::get('bimester'),
			'subject_code' => Input::get('subject_code'),
			'subject_name' => Input::get('subject_name')
		));
		return Response::json($data);


	}


	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		return Response::json(Subject::find($id));
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
		$subject = Subject::find($id);
		$subject->pensum_id = Input::get('pensum_id');
		$subject->bimester = Input::get('bimester');
		$subject->subject_code = Input::get('code');
		$subject->subject_name = Input::get('subject_name');
		$subject->save();
		return Response::json(array(
			'success' => 'Materia actualizada exitosamente :)'
		));
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		Subject::destroy($id);
		return Response::json(array(
			'success' => 'La materia se elimino exitosamente :)'
		));
	}


}
