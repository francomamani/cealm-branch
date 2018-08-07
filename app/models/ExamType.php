<?php 
/**
* 
*/
class ExamType extends Eloquent
{
	
	protected $table = "exam_types";
	protected $fillable = array('group_id', 'description', 'percentage', 'acronym');
	public function group()
	{
		return $this->belongsTo('Group');
	}
	public function categoryMarks()
	{
		return $this->hasMany('CategoryMark');
	}
}
?>