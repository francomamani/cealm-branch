<?php 
/**
* 
*/
class ExamTypeCustomController extends \BaseController
{
	public function categoryMarksByExamType($exam_type_id)
	{
		return Response::json(ExamType::find($exam_type_id)->categoryMarks()->orderBy('description', 'asc')->get());
	}
}
?>