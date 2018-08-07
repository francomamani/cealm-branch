<?php 
/**
* 
*/
class PensumRecord extends Eloquent
{
	protected $fillable = array('student_id', 'pensum_id', 'status');
	protected $table = 'pensum_records';

	public function records()
	{
		return $this->hasMany("Record");
	}

	public function tuitions()
	{
		return $this->hasMany('Tuition');
	}
	public function student()
	{
		return $this->belongsTo('Student');
	}	
}
?>