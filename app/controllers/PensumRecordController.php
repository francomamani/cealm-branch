<?php

class PensumRecordController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return Response::json(PensumRecord::get());
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
		$records = PensumRecord::where('student_id', Input::get('student_id'))
					->where('pensum_id', Input::get('pensum_id'))
					->count();
		if ($records == 0 ) {
			PensumRecord::create(Input::all());
			return Response::json(array('success'=>'Estudiante registrado :)'));
		}else{			
			return Response::json(array('error'=>'Este estudiante ya se registro a esta carrera con anterioridad'));
		}
	}


	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		return Response::json(PensumRecord::find($id));
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
		//
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		PensumRecord::destroy($id);
		return Response::json(array('success'=>'Registro eliminado'));
	}


}
