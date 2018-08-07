<?php 
/**
* 
*/
class CoverImage extends Eloquent
{
	protected $table = 'cover_images';
	protected $fillable = array('description', 'url');	
}
?>