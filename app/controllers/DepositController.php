<?php

class DepositController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
/*		$deposits = Deposit::with('student')->orderBy('id', 'desc')->paginate(10);
		return Response::json($deposits);*/
//		return Response::json(Deposit::orderBy('id', 'desc')->paginate(10));
		$deposits = Deposit::with('student.user')->orderBy('id', 'desc')->get(); 
		return Response::json($deposits);
	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$deposit = Deposit::create(Input::all());
		$deposit->save();
		return $this->show($deposit->id);
	}


	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		return Response::json(Deposit::with('user')->with('student.user')->find($id));
	}


	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$deposit = Deposit::find($id);
		$deposit->fill(Input::all());
		$deposit->save();
		return Response::json($deposit);
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		Deposit::destroy($id);
		return Response::json(array('success' => 'Deposito eliminado'));
	}


}
