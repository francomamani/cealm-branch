<?php 
/**
* 
*/
class Tuition extends Eloquent
{
	protected $table = 'tuitions';
	protected $fillable = array('year_id', 'pensum_record_id', 'price');
	public function year()
	{
		return $this->belongsTo('Year');
	}
	public function pensunRecord()
	{
		return $this->belongsTo('PensumRecord');
	}
}
?>