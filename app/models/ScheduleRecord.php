<?php  
/**
* 
*/
class ScheduleRecord extends Eloquent
{
	protected $table = "schedule_records";
	protected $fillable = array('group_id', 'room_id', 'schedule_id', 'day');

	public function group()
	{
		return $this->belongsTo('Group');
	}
	public function schedule()
	{
		return $this->belongsTo('Schedule');
	}
	public function room()
	{
		return $this->belongsTo('Room');
	}	
}
?>