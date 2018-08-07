<?php 
/**
* 
*/
class ReportController extends \BaseController
{
	public function finalScoreByRecord($record_id)
	{
	  /*record*/
	  $scores = Record::select(DB::raw('
	  				bimesters.name as bimestre,
	  				groups.name as grupo,
	  				exam_types.description as tipo_examen,
	  				category_marks.description as categoria,
	  				avg(item_marks.score)*category_marks.percentage*exam_types.percentage/10000 as nota,
					count(item_marks.score) as num_exams 				
	  				'))
	  				->join('groups', 'groups.id', '=', 'records.group_id')
	  				->join('bimesters', 'bimesters.id', '=', 'groups.bimester_id')
	  				->join('item_marks', 'item_marks.record_id', '=', 'records.id')
					->join('information_marks', 'information_marks.id', '=', 'item_marks.information_mark_id')
					->join('category_marks', 'category_marks.id', '=', 'information_marks.category_mark_id')
					->join('exam_types', 'exam_types.id', '=', 'category_marks.exam_type_id')
					->where('records.id', '=', $record_id)
					->groupBy('category_marks.id')
					->get()->toArray();
		$average = 0;
		foreach ($scores as $score) {
			$average += $score['nota'];
		}
		$array = array(
			'final_score' => $average
		);

		return $array;
	}
	public function statistics()
	{
		$level = Input::get('level'); //academic level as tecnico medio, tecnico superior

		$students = Bimester::join('records', 'records.bimester_id', '=', 'bimesters.id')
						->join('pensum_records', 'pensum_records.id', '=', 'records.pensum_record_id')
						->join('students', 'students.id', '=', 'pensum_records.student_id')
						->join('users', 'users.id', '=', 'students.user_id')
						->where('bimesters.id', Input::get('bimester_id'))
						->where('students.type', Input::get('type'))
						->where('students.level', Input::get('level'))
						->orderBy('users.lastname', 'asc')
						->get([
							 'students.id as student_id',
							 'users.lastname',
		  				 	 'users.firstname',
							 'users.birthday',
							 'users.gender',
							 'users.identity_card', 
							 'students.type', 
							 'students.level'
						]);

		$women = Bimester::join('records', 'records.bimester_id', '=', 'bimesters.id')
						->join('pensum_records', 'pensum_records.id', '=', 'records.pensum_record_id')
						->join('students', 'students.id', '=', 'pensum_records.student_id')
						->join('users', 'users.id', '=', 'students.user_id')
						->where('bimesters.id', Input::get('bimester_id'))
						->where('students.type', Input::get('type'))
						->where('students.level', Input::get('level'))
						->where('users.gender', 'mujer')
						->orderBy('users.lastname', 'asc')
						->count();

		$men = Bimester::join('records', 'records.bimester_id', '=', 'bimesters.id')
						->join('pensum_records', 'pensum_records.id', '=', 'records.pensum_record_id')
						->join('students', 'students.id', '=', 'pensum_records.student_id')
						->join('users', 'users.id', '=', 'students.user_id')
						->where('bimesters.id', Input::get('bimester_id'))
						->where('students.type', Input::get('type'))
						->where('students.level', Input::get('level'))
						->where('users.gender', 'varon')
						->orderBy('users.lastname', 'asc')
						->count();

		$records = Bimester::join('records', 'records.bimester_id', '=', 'bimesters.id')
						->join('pensum_records', 'pensum_records.id', '=', 'records.pensum_record_id')
						->join('students', 'students.id', '=', 'pensum_records.student_id')
						->join('users', 'users.id', '=', 'students.user_id')
						->where('bimesters.id', Input::get('bimester_id'))
						->where('students.type', Input::get('type'))
						->where('students.level', Input::get('level'))
						->orderBy('users.lastname', 'asc')
						->get(['records.*']);

		$pass = 0;
		$fail = 0;
		$drop = 0;

		foreach ($records as $record) {
			$score = $this->finalScoreByRecord($record);
			if ($score['final_score'] >= 70) {
				$pass++;
			}else{
				if ($score['final_score'] <= 10) {
					$drop++;
				}else{
					$fail++;
				}
			}
		}

		$total = Bimester::join('records', 'records.bimester_id', '=', 'bimesters.id')
						->join('pensum_records', 'pensum_records.id', '=', 'records.pensum_record_id')
						->join('students', 'students.id', '=', 'pensum_records.student_id')
						->join('users', 'users.id', '=', 'students.user_id')
						->where('bimesters.id', Input::get('bimester_id'))
						->where('students.type', Input::get('type'))
						->where('students.level', Input::get('level'))
						->orderBy('users.lastname', 'asc')
						->count();

		//return Response::json($students);
		$data = array(
			'students' => $students->toArray(),
			'pass' => $pass,
			'fail' => $fail,
			'drop' => $drop,
			'women' => $women, 
			'men' => $men,
			'total' => $total
		);
		return Response::json($data);
	}	


	public function renderStructure($group_id)
	{
		$group = Group::with([
			'examTypes.categoryMarks.informationMarks.itemMarks.record.pensum_record.student.user' => function($q){
				$q->orderBy('lastname', 'asc');
			},
			'examTypes.categoryMarks.informationMarks.itemMarks.record.pensum_record.student.user'
			])->find($group_id)->toArray();
//		$students = Group::with('records.pensum_record.student.user')->find($group_id)->toArray();
		$students = Group::join('records', 'records.group_id', '=', 'groups.id')
						 ->join('pensum_records', 'pensum_records.id', '=','records.pensum_record_id')
						 ->join('students', 'students.id', '=', 'pensum_records.student_id')
						 ->join('users', 'users.id', '=', 'students.user_id')
						 ->where("groups.id", $group_id)
						 ->get(['students.*', 'users.lastname', 'users.firstname'])
						 ->toArray();
		$structure = array(
			'group' 	=> $group,
			'students' 	=> $students
		);
		return Response::json($structure);
	}
/*	public function renderStructure2($group_id)
	{
		$group = Group::find($group_id)->toArray();
		$bimester = Group::find($group_id)->bimester()->firstOrFail()->toArray();
		$information_marks = Group::join('exam_types', 'exam_types.group_id', '=', 'groups.id')
			 			  ->join('category_marks', 'category_marks.exam_type_id', '=', 'exam_types.id')
			 			  ->join('information_marks', 'information_marks.category_mark_id', '=', 'category_marks.id')
			 			  ->where('groups.id', $group_id)
						  ->orderBy('information_marks.id', 'asc')
			 			  ->get(['information_marks.*'])->toArray();

		$category_marks = Group::join('exam_types', 'exam_types.group_id', '=', 'groups.id')
			 			  ->join('category_marks', 'category_marks.exam_type_id', '=', 'exam_types.id')
			 			  ->where('groups.id', $group_id)
			 			  ->get(['category_marks.*'])->toArray();

		$exam_types = Group::join('exam_types', 'exam_types.group_id', '=', 'groups.id')
			 			  ->where('groups.id', $group_id)
			 			  ->get(['exam_types.*'])->toArray();

		$item_marks = Group::join('exam_types', 'exam_types.group_id', '=', 'groups.id')
			 			  ->join('category_marks', 'category_marks.exam_type_id', '=', 'exam_types.id')
			 			  ->join('information_marks', 'information_marks.category_mark_id', '=', 'category_marks.id')
			 			  ->join('item_marks', 'item_marks.information_mark_id', '=', 'information_marks.id')
			 			  ->join('records', 'records.id', '=', 'item_marks.record_id')
			 			  ->join('pensum_records', 'pensum_records.id',  '=', 'records.pensum_record_id')
			 			  ->join('students', 'students.id',  '=', 'pensum_records.student_id')
			 			  ->join('users', 'users.id', '=', 'students.user_id')
			 			  ->where('groups.id', $group_id)
			 			  ->orderBy('users.lastname', 'asc')
			 			  ->get(['item_marks.*', 'users.lastname', 'users.firstname', 'users.cellphone'])->toArray();
		
		$items = Group::join('exam_types', 'exam_types.group_id', '=', 'groups.id')
			 			  ->join('category_marks', 'category_marks.exam_type_id', '=', 'exam_types.id')
			 			  ->join('information_marks', 'information_marks.category_mark_id', '=', 'category_marks.id')
			 			  ->join('item_marks', 'item_marks.information_mark_id', '=', 'information_marks.id')
			 			  ->join('records', 'records.id', '=', 'item_marks.record_id')
			 			  ->join('pensum_records', 'pensum_records.id',  '=', 'records.pensum_record_id')
			 			  ->join('students', 'students.id',  '=', 'pensum_records.student_id')
			 			  ->join('users', 'users.id', '=', 'students.user_id')
			 			  ->where('groups.id', $group_id)
			 			  ->groupBy('users.id')
			 			  ->orderBy('users.lastname', 'asc')
			 			  ->get(['records.id as record_id', 'users.lastname', 'users.firstname', 'users.cellphone'])->toArray();

		$list = array();
		foreach ($items as $item) {
			$marks = Group::join('exam_types', 'exam_types.group_id', '=', 'groups.id')
				 			  ->join('category_marks', 'category_marks.exam_type_id', '=', 'exam_types.id')
				 			  ->join('information_marks', 'information_marks.category_mark_id', '=', 'category_marks.id')
				 			  ->join('item_marks', 'item_marks.information_mark_id', '=', 'information_marks.id')
				 			  ->join('records', 'records.id', '=', 'item_marks.record_id')
				 			  ->join('pensum_records', 'pensum_records.id',  '=', 'records.pensum_record_id')
				 			  ->join('students', 'students.id',  '=', 'pensum_records.student_id')
				 			  ->join('users', 'users.id', '=', 'students.user_id')
				 			  ->where('groups.id', $group_id)
				 			  ->where('records.id', $item['record_id'])
						      ->orderBy('information_marks.id', 'asc')
				 			  ->get(['item_marks.*'])->toArray();
			array_push($list, array(
				"firstname" => $item["firstname"],
				"lastname" => $item["lastname"],
				"cellphone" => $item["cellphone"],
				"marks" => $marks
			));
		}

		return Response::json(compact('information_marks', 'category_marks', 'exam_types', 'item_marks', 'list', 'group', 'bimester'));
	}*/
}
?>