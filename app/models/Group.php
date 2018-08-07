<?php 
/**
* 
*/
class Group extends Eloquent
{
	protected $table = "groups";
	protected $fillable  = array(
	    'teacher_id',
        'subject_id',
        'bimester_id',
        'room_id',
        'parallel',
        'name',
        'from',
        'to',
    );

	public function teacher()
	{
		return $this->belongsTo('Teacher');
	}
	public function bimester()
	{
		return $this->belongsTo('Bimester');
	}
	public function records()
	{
		return $this->hasMany('Record');
	}
	public function examTypes()
	{
		return $this->hasMany('ExamType');
	}
	public function informationMarks()
	{
		return $this->hasMany('InformationMark');
	}
	public function room()
	{
		return $this->belongsTo('Room');
	}
	public function subject() {
	    return $this->belongsTo('Subject');
    }
}
?>