<?php 
/**
* 
*/
class Category extends Eloquent
{
	protected $table = "categories";
	protected $fillable = array('language_id', 'description', 'acronym');

	public function language()
	{
		return $this->belongsTo('Language'); 
	}
}
?>