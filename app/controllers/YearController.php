<?php

class YearController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return Response::json(Year::get());
	}



	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$years = Year::where('name', Input::get('name'))->count();
		if ($years !=0 ) {
			return Response::json(array('error' => 'El anio ya esta registrado en el sistema'));
		}else{
			$year = Year::create(Input::all());
			return Response::json($year);
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
		return Response::json(Year::find($id));
	}


	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$year = Year::find($id);
		$year->fill(Input::all())->save();
		return Response::json($year);
/*		return Response::json('El anio fue actualizado correctamente');*/
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		Year::destroy($id);
		Response::json(array('success' => 'El anio fue eliminado exitosamente'));
	}


}
