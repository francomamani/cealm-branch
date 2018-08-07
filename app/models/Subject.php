<?php 
/**
* 
*/
class Subject extends Eloquent
{
	protected $table = "subjects";
	protected $fillable = array('pensum_id', 'bimester', 'subject_code', 'subject_name');
	
	public function pensum()
	{
		return $this->belongsTo('Pensum');
	}	
	public function levels()
	{
		return $this->hasMany('Level');
	}
	public function groups() {
	    return $this->hasMany('Group');
    }
}
?>