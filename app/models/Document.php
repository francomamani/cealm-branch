<?php 
/**
* 
*/
class Document extends Eloquent
{
	
	protected $fillable = array('document_reception_id', 'type', 'url');
	protected $table = "documents";

	public function documentReception()
	{
		return $this->BelongsTo('DocumentReception');
	}
	
}
?>