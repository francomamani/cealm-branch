<?php

class BalanceController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return Response::json(Balance::orderBy('year', 'desc')->get());
	}



	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		try {
			$balances = Balance::where('month', Input::get('month'))
				   			   ->where('year', Input::get('year'))
				   			   ->count();
			$abiertos = Balance::where('status', 'abierto')->count();
			if ($abiertos == 0) {
				if ($balances == 0) {
					return Response::json(Balance::create(Input::all()));
				}else{
					throw new Exception("Apertura mensual duplicada");
				}
			}else{				
					throw new Exception("Por favor cierre sus cuentas mensuales primero.");
			}
		} catch (Exception $e) {
			return Response::json(array('error'=>$e->getMessage()));
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
		return Response::json(Balance::find($id));
	}


	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$balance = Balance::find($id);
		$balance->fill(Input::all());
		$balance->save();
		return Response::json($balance);
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$balance = Balance::find($id);
		$balance->delete();
		return Response::json(array('exito'=>'El balance del mes fue eliminado! :O'));
	}

	public function currentBalance()
	{
		return Response::json(Balance::where('status', 'abierto')->firstOrFail());
	}
}
