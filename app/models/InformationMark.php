<?php 
/**
* 
*/
class InformationMark extends Eloquent
{
	protected $table = 'information_marks';
	protected $fillable = array('group_id', 'category_mark_id', 'exam_type_id', 'title', 'description', 'start_date', 'end_date');

	public function group()
	{
		return $this->belongsTo('Group');
	}
	public function categoryMark()
	{
		return $this->belongsTo('CategoryMark');
	}
	public function itemMarks()
	{
		return $this->hasMany('ItemMark');
	}
}
?>