<?php 
/**
* 
*/
class Record extends Eloquent
{
	protected $table = 'records';
	protected $fillable =  array('bimester_id', 'pensum_record_id', 'group_id', 'student_id', 'final_score', 'observations');	

	public function pensum_record()
	{
		return $this->belongsTo("PensumRecord");
	}

	public function bimester()
	{
		return $this->belongsTo("Bimester");
	}

	public function group()
	{
		return $this->belongsTo("Group");
	}

	public function itemMarks()
	{
		return $this->hasMany('ItemMark');
	}

}
?>