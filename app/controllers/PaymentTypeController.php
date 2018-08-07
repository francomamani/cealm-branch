<?php

class PaymentTypeController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return Response::json(PaymentType::orderBy('description', 'asc')->get());
	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		return Response::json(PaymentType::create(Input::all()));
	}


	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		return Response::json(PaymentType::find($id));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$paymentType = PaymentType::find($id);
		$paymentType->fill(Input::all());
		$paymentType->save();
		return Response::json($paymentType);
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$amount = PaymentType::find($id)->paymentItems()->count();
		if ($amount == 0) {
			PaymentType::destroy($id);
			return Response::json(array('success' => 'Tipo de pago eliminado'));
		}else{
			return Response::json(array('error' => 'Tipo de pago no puede ser eliminado'));
		}
	}

	public function searchPaymentTypes($value)
	{
		$paymentTypes = PaymentType::where('description', 'like', '%'.$value.'%')->get();
		return Response::json($paymentTypes);
	}
}