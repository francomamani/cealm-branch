<?php 
/**
* 
*/
class DocumentReception extends Eloquent
{
	protected $fillable = array('student_id', 'code');
	protected $table = "documents_reception";

	public function student()
	{
		return $this->belongsTo('Student');
	}
	
	public function documents()
	{
		return $this->hasMany('Document');
	}
}
?>