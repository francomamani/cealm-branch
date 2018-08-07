<?php

class PaymentItemController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		$payments = Payment::join('payment_items', 'payment_items.payment_id', '=', 'payments.id')
			   				->join('payment_types', 'payment_types.id', '=', 'payment_items.payment_type_id')
			   				->get(['payment_items.*', 'payment_types.description']);
		return Response::json($payments);
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$payment = Payment::find(Input::get('payment_id'));
		$currentAmount = $payment->paymentItems()->sum('amount');
		$amount = Input::get('amount');	
		$total = $currentAmount + $amount;
		if ($total <= $payment->amount) {
			$paymentItem = PaymentItem::create(Input::all());
			$p = Payment::join('payment_items', 'payment_items.payment_id', '=', 'payments.id')
			   			->join('payment_types', 'payment_types.id', '=', 'payment_items.payment_type_id')
			   			->where('payment_items.id', $paymentItem->id)
			   			->first(['payment_items.*', 'payment_types.description']);
			return Response::json($p);
		}else{
			return Response::json(array('error' => 'Monto fuera de rango'));
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
		return Response::json(PaymentItem::find($id));
	}


	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{

		$payment = Payment::find(Input::get('payment_id'));
		$currentAmount = $payment->paymentItems()->sum('amount');
		$amount = Input::get('amount');	
		$total = $currentAmount - PaymentItem::find($id)->amount + $amount;
		
		if ($total <= $payment->amount) {
			$paymentItem = PaymentItem::find($id);
			$paymentItem->fill(Input::all());
			$paymentItem->save();
			$p = PaymentItem::join('payment_types', 'payment_types.id', '=', 'payment_items.payment_type_id')
		   					->where('payment_items.id', $id)
		   					->first(['payment_items.*', 'payment_types.description']);
			return Response::json($p);
		}else{
			return Response::json(array('error' => 'Monto fuera de rango'));
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
		PaymentItem::destroy($id);
		return Response::json(array('success' => 'Tipo de pago eliminado'));
	}

	public function paymentItemsByPayment($payment_id)
	{
		$payments = Payment::join('payment_items', 'payment_items.payment_id', '=', 'payments.id')
			   				->join('payment_types', 'payment_types.id', '=', 'payment_items.payment_type_id')
			   				->where('payments.id', $payment_id)
			   				->get(['payment_items.*', 'payment_types.description']);
//		return Response::json(Payment::find($payment_id)->paymentItems()->get());
		return Response::json($payments);
	}

}
