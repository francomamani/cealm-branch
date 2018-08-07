<?php 
/**
* 
*/
class Language extends Eloquent
{
	protected $table = "languages";
	protected $fillable = array('name', 'spanish_name', 'acronym');

	public function pensums()
	{
		return $this->hasMany('Pensum');
	}

	public function categories()
	{
		return $this->hasMany('Category'); 
	}
}
?>