<?php 
/**
* 
*/
class Level extends Eloquent
{
	protected $table = "levels";
	protected $fillable = array('subject_id', 'level_code','level_name');

	public function subject()
	{
		return $this->belongsTo("Subject");
	}
}

?>