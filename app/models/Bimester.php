<?php 
/**
* 
*/
class Bimester extends Eloquent
{
	protected $table = 'bimesters';
	protected $fillable = array('num_bimester', 'year_id', 'name', 'progress', 'from', 'to');

	public function groups()
	{
		return $this->hasMany('Group');
	}

	public function schedules()
	{
		return $this->hasMany('Schedule');
	}
	public function records()
	{
		return $this->hasMany('Record');
	}
	public function year()
	{
		return $this->belongsTo('Year');
	}
}
?>