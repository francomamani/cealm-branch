<?php 
class BimesterCustomController extends BaseController
{
	public function setCurrentBimester($id)
	{
		$bimesters = Bimester::where('progress', true)->get();
		foreach ($bimesters as $b) {
			$b->progress = false;
			$b->save();
		}
		$bimester = Bimester::find($id);
		$bimester->progress = true;
		$bimester->save();
		return Response::json(array('success'=>'Bimester Actual: '.$bimester->name));
	}	
	public function getCurrentBimester()
	{
		return Response::json(Bimester::where('progress', 1)->first());
	}
	public function teacherGroupsByBimester($teacher_id, $bimester_id)
	{
		return Response::json(Bimester::find($bimester_id)->groups()->where('teacher_id', $teacher_id)->orderBy('name', 'asc')->get());
	}
	public function bimestersByYear($year_id)
	{
		return Response::json(Year::find($year_id)->bimesters()->orderBy('name', 'asc')->get());
	}
	/*groups by teachers of current bimester*/
	public function currentGroupsByTeacher()
	{
		$groups = Bimester::join('groups', 'groups.bimester_id', '=', 'bimesters.id')
						  ->join('rooms','rooms.id', '=', 'groups.room_id')
						  ->join('teachers', 'teachers.id', '=', 'groups.teacher_id')
						  ->join('users', 'users.id', '=','teachers.user_id')	
						  ->where('bimesters.progress', 1)
						  ->orderBy('users.lastname', 'asc')
						  ->get([
						  	'groups.id as group_id',
						  	'users.lastname',
						  	'users.firstname',
						  	'teachers.type',
						  	'users.cellphone',
						  	'groups.name as group_name',
						  	'groups.from',
						  	'groups.to',
						  	'rooms.name as room_name'	
						  	]);
		return Response::json($groups);
	}
}
?>