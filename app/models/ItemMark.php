<?php 
/**
* 
*/
class ItemMark extends Eloquent
{
	protected $table = 'item_marks';
	protected $fillable = array('record_id', 'information_mark_id', 'observation', 'score');

	public function record()
	{
		return $this->belongsTo('Record');
	}

	public function informationMark()
	{
		return $this->belongsTo('InformationMark');
	}
}
?>