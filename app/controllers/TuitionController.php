<?php

class TuitionController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return Response::json(Tuition::get());
	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$year = Year::join('bimesters', 'years.id', '=', 'bimesters.year_id')
						 ->where('bimesters.progress', true)
						 ->firstOrFail();
		$tuition = Tuition::create(array(
						'year_id' => $year->year_id, 
						'pensum_record_id' => Input::get('pensum_record_id'),
						'price' => Input::get('price')
					));
		return Response::json($tuition);
	}


	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		return Response::json(Tuition::find($id));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$tuition = Tuition::find($id);
		$tuition->fill(Input::all())->save();
		return Response::json(array('success' => 'Cuota de matricula actualizada')); 
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{

	}


}
