<?php 
/**
* 
*/
use Illuminate\Database\Eloquent\SoftDeletingTrait;

class Control extends Eloquent
{
	protected $table = 'controls';
	protected $fillable = array('user_id');
	protected $dates = ['deleted_at'];
}
?>