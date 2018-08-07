<?php 
/**
* 
*/
class PaymentItem extends Eloquent
{
	protected $fillable = array(
			'payment_id',
			'payment_type_id',
			'month',
			'year',
			'amount',
			'additional_information'
		);
	protected $table  = "payment_items";

	public function payment()
	{
		return $this->belongsTo('Payment');
	}

	public function paymentType()
	{
		return $this->belongsTo('PaymentType');
	}
}
?>