<?php

class RecordController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		//
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
		$record = Record::where('pensum_record_id', Input::get('pensum_record_id'))
						->where('group_id', Input::get('group_id'))
						->where('student_id', Input::get('student_id'))
						->where('bimester_id', Input::get('bimester_id'))
						->count();
		if ($record !=0) {
			return Response::json(array('error' => 'El estudiante ya fue registrado al curso este bimestre'));
		}else{
			Record::create(Input::all());
			return Response::json(array('success' => 'Se registro a un estudiante en un curso'));			
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
		//
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
		//
	}


}
