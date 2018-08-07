<?php 
/**
* 
*/
class Year extends Eloquent
{
	protected $fillable = array('name', 'start');	
	protected $table = 'years';

	public function bimesters()
	{
		return $this->hasMany('Bimester');
	}
	public function tuitions()
	{
		return $this->hasMany('Tuition');
	}
}
?>