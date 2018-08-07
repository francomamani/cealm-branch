<?php 
/**
* 
*/
class Room extends Eloquent
{
	protected $table = "rooms";
	protected $fillable = array('name', 'capacity');
/*
	public function scheduleRecords()
	{
		return $this->hasMany('ScheduleRecord');
	}
*/
	public function groups()
	{
		return $this->hasMany('Group');
	}

}
?>