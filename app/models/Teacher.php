<?php 
/**
* 
*/
use Illuminate\Database\Eloquent\SoftDeletingTrait;
class Teacher extends Eloquent
{
	protected $table = 'teachers';
	protected $fillable = array('user_id','type', 'field_of_study');
	protected $dates = ['deleted_at'];

	public function user()
	{
		return $this->belongsTo('User');
	}
	
	public function groups()
	{
		return $this->hasMany('Group');
	}
}
?>