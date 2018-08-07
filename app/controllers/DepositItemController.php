<?php

class DepositItemController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return Response::json(DepositItem::get());
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$depositItem = DepositItem::create(Input::all());
		return Response::json($depositItem);
	}


	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		return Response::json(DepositItem::find($id));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$depositItem = DepositItem::find($id);
		$depositItem->fill(Input::all());
		$depositItem->save();
		return Response::json($depositItem);
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		DepositItem::destroy($id);
		return Response::json(array('success' => 'Item de deposito eliminado'));
	}

	public function depositItemsByDeposit($deposit_id)
	{
		$depositItems = Deposit::join('deposit_items', 'deposit_items.deposit_id', '=', 'deposits.id')
			   				   ->join('deposit_types', 'deposit_types.id', '=', 'deposit_items.deposit_type_id')
			   				   ->join('students', 'students.id','=', 'deposits.student_id')
			   				   ->join('users', 'users.id', '=', 'students.user_id')			   				   
			   				   ->where('deposits.id', $deposit_id)
			   				   ->orderBy('deposit_items.id', 'desc')
			   				   ->get(['deposit_items.*', 'deposit_types.description', 'users.firstname', 'users.lastname']);
/*			   				   ->join('pensum_records', 'pensum_records.student_id', '=', 'students_id')*/
		return Response::json($depositItems);
	}


}
