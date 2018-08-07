<?php 
/**
* 
*/
class CategoryMark extends Eloquent
{
	protected $table = 'category_marks';
	protected $fillable = array('exam_type_id', 'description', 'percentage', 'acronym');

	public function examType()
	{
		return $this->belongsTo('ExamType');
	}
	public function informationMarks()
	{
		return $this->hasMany('InformationMark');
	}
}
?>