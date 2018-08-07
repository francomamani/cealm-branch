<?php 
/**
* 
*/
use Illuminate\Database\Eloquent\SoftDeletingTrait;

class Administrator extends Eloquent
{
	protected $table = 'administrators';
	protected $fillable = array('user_id');
	protected $dates = ['deleted_at'];
}
?>