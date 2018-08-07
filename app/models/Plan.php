<?php 
/**
* 
*/
class Plan extends Eloquent
{
	protected $table = "planes";
	protected $fillable = array('teacher_id', 'subject', 'url', 'send_date', 'student_id');
}
?>