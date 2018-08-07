<?php 
/**
* 
*/
class Payment extends Eloquent
{
	protected $fillable = array(
			'balance_id',
			'user_id',
			'amount',
			'payment_date',
			'creditor',
			'creditor_ci',
		);	
	protected $table = 'payments';

	public function paymentItems()
	{
		return $this->hasMany('PaymentItem');
	}
	public function balance()
	{
		return $this->belongsTo('Balance');
	}
	public function user()
	{
		return $this->belongsTo('User');
	}
}
?>