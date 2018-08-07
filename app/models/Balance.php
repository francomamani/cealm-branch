<?php 
/**
* 
*/
class Balance extends Eloquent
{
	protected $table = 'balances';
	protected $fillable = array('opening_balance', 'closing_balance', 'month', 'year', 'status');

	public function payments()
	{
		return $this->hasMany('Payment');
	}
	
	public function deposits()
	{
		return $this->hasMany('Deposit');
	}

}
?>