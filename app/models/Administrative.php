<?php 
/**
* 
*/
use Illuminate\Database\Eloquent\SoftDeletingTrait;

class Administrative extends Eloquent
{
	protected $table = 'administratives';
	protected $fillable = array('user_id');	
	protected $dates = ['deleted_at'];
}
?>