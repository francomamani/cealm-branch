<?php 
/**
* 
*/
class DepositType extends Eloquent
{

	protected $fillable = array('description');
	protected $table = 'deposit_types';

	public function depositItems()
	{
		return $this->hasMany('DepositItem');
	}
}
?>