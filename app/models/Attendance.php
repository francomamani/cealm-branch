<?php 
class Attendance extends Eloquent
{
	protected $fillable = array('user_id', 'record_date', 'record_time', 'record_type');
	protected $table = "attendances";	

	public function user()
	{
		return $this->belongsTo("User");
	}
}
?>