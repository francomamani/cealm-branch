<?php 
/**
* 
*/
use Illuminate\Database\Eloquent\SoftDeletingTrait;

class Student extends Eloquent
{
	protected $table = 'students';
	protected $fillable = array('user_id','type', 'level');
	protected $dates = ['deleted_at'];

	public function user()
	{
		return $this->belongsTo('User');
	}
	public function pensumRecords()
	{
		return $this->hasMany('PensumRecord');
	}
	public function deposits()
	{
		return $this->hasMany('Deposit');
	}
	public function documentReception()
	{
		return $this->hasOne('DocumentReception');
	}	
}
?>