<?php

class PensumController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return Response::json(Pensum::orderBy('name', 'asc')->get());
	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$pensums = Pensum::where('name', Input::get('name'))->count();
		if ($pensums == 0) {
			Pensum::create(array(
				'language_id' => Input::get('language_id'), 
				'year' => Input::get('year'), 
				'name' => Input::get('name'), 
				'empty' => true
			));
			return Response::json(array(
				'success' => 'Pensum creado exitosamente :)'
			));
		}else{
			return Response::json(array(
				'error' => 'El pensum ya existe'
			));			
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
		return Response::json(Pensum::find($id));
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
		$data = array();
		$pensum = Pensum::find($id);
		if ($pensum) {
			$pensum->year = Input::get('year');
			$pensum->name = Input::get('name');
			$pensum->empty = Input::get('empty');//false
			$pensum->save();
			$data['success'] = 'El pensum fue actualizado exitosamente';
		}else{			
			$data['error'] = 'No existe dicho pensum';
		}
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$data = array();
		$pensum = Pensum::find($id);
		if ($pensum) {
			$pensum->delete();
			$data['success'] = 'El pensum fue eliminado exitosamente';
		}else{			
			$data['error'] = 'No existe dicho pensum';
		}
	}


}
