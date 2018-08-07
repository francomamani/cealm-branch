<?php 
/**
* 
*/
class PaymentType extends Eloquent
{
	protected $fillable = array('description');
	protected $table = 'payment_types';

	public function paymentItems()
	{
		return $this->hasMany('PaymentItem');
	}	
}
 ?>