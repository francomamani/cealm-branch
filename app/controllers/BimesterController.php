<?php

class BimesterController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return Response::json(Bimester::orderBy('name', 'desc')->get());
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
		$num_bimester = Input::get('num_bimester');
		$year_id = Input::get('year_id');
		$year = Year::find($year_id);
		$bimesters = Bimester::where('year_id', $year_id)->where('num_bimester', $num_bimester)->count();
		if ($bimesters != 0) {
				return Response::json(array('error'=>'El bimestre ya existe'));
		}
		$input = Input::all();
		$bimester =  new Bimester();
		$bimester->num_bimester = Input::get('num_bimester');
		$bimester->year_id = Input::get('year_id');
		$bimester->name = Input::get('num_bimester') . ' / ' . $year->name; 
		$bimester->progress = Input::get('progress');
		$bimester->from = Input::get('from');
		$bimester->to = Input::get('to');
		$bimester->save();
		return Response::json($bimester);
	}


	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		return Response::json(Bimester::find($id));
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
		$bimester = Bimester::find($id);
		if ($bimester) {
			$bimester->from = Input::get('from');
			$bimester->to = Input::get('to');			
			$bimester->save();
			return Response::json(array('success'=>'El bimestre fue actualizado'));
		}else{
			return Response::json(array('error'=>'El bimestre no existe'));
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
		Bimester::destroy($id);
		return Response::json(array('success'=>'El bimestre fue eliminado' ));
	}


}
