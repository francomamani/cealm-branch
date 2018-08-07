<?php

class DepositTypeController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return Response::json(DepositType::get());
	}



	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$depositType = DepositType::create(Input::all());
		return Response::json($depositType);
	}


	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		return Response::json(DepositType::find($id));
	}


	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$depositType = DepositType::find($id);
		$depositType->fill(Input::all());
		$depositType->save();
		return Response::json($depositType);
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$amount  = DepositType::find($id)->depositItems()->count();
		if ($amount==0) {
			DepositType::destroy($id);
			return Response::json(array('success'=>'Tipo de deposito eliminado'));
		}else{			
			return Response::json(array('error'=>'Este tipo de deposito no puede ser eliminado'));
		}
	}

	public function searchDepositTypes($value)
	{
		$depositTypes = DepositType::where('description', 'like', '%'.$value.'%')->get();
		return Response::json($depositTypes);
	}

}
