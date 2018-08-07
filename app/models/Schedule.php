<?php 
/**
* 
*/
class Schedule extends Eloquent
{
	
	protected $table = 'schedules';
	protected $fillable = array('bimester_id', 'from','to');

	public function scheduleRecords()
	{
		return $this->hasMany('ScheduleRecord');
	}
	public function bimester()
	{
		return $this->belongsTo('Bimester');
	}
}
?>