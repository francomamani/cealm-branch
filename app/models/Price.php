<?php 
/**
* 
*/
class Price extends Eloquent
{
	protected $fillable = array('description', 'price');
	protected $table = "prices";
}
?>