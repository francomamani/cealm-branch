<?php

class PaymentController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return Response::json(Payment::with('user')->orderBy('payments.id', 'desc')->paginate(10));
/*		$payments = Payment::join('users', 'users.id', '=', 'payments.user_id')
						   ->orderBy('payments.id', 'desc')
						   ->get(['payments.*', 'users.firstname', 'users.lastname']);
		return Response::json($payments);*/
	}



	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$payment = Payment::create(Input::all());
		return $this->show($payment->id);
	}


	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		return Response::json(Payment::with('user')->find($id));
	}



	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$payment = Payment::find($id);
		$payment->fill(Input::all());
		$payment->save();
		return Response::json($payment);
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$amount = Payment::find($id)->paymentItems()->count();
		if ($amount == 0) {
			Payment::destroy($id);
			return Response::json(array('success' => 'Pago eliminado'));
		}else{			
			return Response::json(array('error' => 'El pago no puede ser eliminado'));
		}

	}


}
