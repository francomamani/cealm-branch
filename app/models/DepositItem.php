<?php 
/**
* 
*/
class DepositItem extends Eloquent
{
	protected $table = "deposit_items";
	protected $fillable = array(
							'deposit_id',
							'deposit_type_id',
							'month',
							'year',
							'amount',
							'additional_information'
						);

	public function deposit()
	{
		return $this->belongsTo('Deposit');
	}
	
	public function depositType()
	{
		return $this->belongsTo('DepositType');
	}

}
?>