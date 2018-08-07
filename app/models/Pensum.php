<?php 
/**
* 
*/
class Pensum extends Eloquent
{
	protected $table = "pensums";
	protected $fillable = array('language_id','year', 'name', 'empty');
 
	public function subjects()
	{
		return $this->hasMany('Subject');
	}
	public function language()
	{
		return $this->belongsTo('Language');
	}
}
?>