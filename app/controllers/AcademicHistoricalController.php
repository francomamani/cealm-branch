<?php

class AcademicHistoricalController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return Response::json(AcademicHistorical::all());
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
		AcademicHistorical::create(Input::all());
		return Response::json(array('success'=>'Historial Académico creado'));
	}


	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		return Response::json(AcademicHistorical::find($id));
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
		$academic_historical = AcademicHistorical::find($id);
		$academic_historical->approved_subjects = Input::get('approved_subjects');
		$academic_historical->mean = Input::get('mean');
		$academic_historical->save();
		return Response::json(array('success' => 'Historial Académico actualizado'));
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		AcademicHistorical::destroy($id);
		return Response::json(array('success'=>'Historial Académico eliminado'));
	}


}
