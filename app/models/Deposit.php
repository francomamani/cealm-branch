<?php 
/**
* 
*/
class Deposit extends Eloquent
{
	protected $table = "deposits";
	protected $fillable = array( 'balance_id',
								 'user_id',
								 'amount',
		                         'student_id',
								 'deposit_date',
								 'client',
								 'client_identity_card',
								 );	
	public function balance()
	{
		return $this->belongsTo('Balance');
	}
	public function user()
	{
		return $this->belongsTo("User");
	}
	
	public function student()
	{
		return $this->belongsTo("Student");
	}

	public function depositItems()
	{
		return $this->hasMany("DepositItem");
	}
}
?>