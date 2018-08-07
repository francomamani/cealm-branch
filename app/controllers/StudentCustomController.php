<?php 
/**
* 
*/
class StudentCustomController extends BaseController
{
	public function searchStudent()
	{
		$value = Input::get("value");
		$pensum_id = Input::get('pensum_id');
		$users = User::where(function ($query) use ($value){
		    $query->orWhere('firstname', 'like', '%'.$value.'%');
		    $query->orWhere('lastname', 'like', '%'.$value.'%');
		    $query->orWhere('email', 'like', '%'.$value.'%');
		    $query->orWhere('gender', 'like', '%'.$value.'%');
		    $query->orWhere('phone', 'like', '%'.$value.'%');
		    $query->orWhere('cellphone', 'like', '%'.$value.'%');
		    $query->orWhere('address', 'like', '%'.$value.'%');
		    $query->orWhere('identity_card', 'like', '%'.$value.'%');
		    $query->orWhere('occupation', 'like', '%'.$value.'%');
		    $query->orWhere('contact_person', 'like', '%'.$value.'%');
		    $query->orWhere('contact_person_phone', 'like', '%'.$value.'%');
		    $query->orWhere('contact_person_cellphone', 'like', '%'.$value.'%');
		    $query->orWhere('username', 'like', '%'.$value.'%');
		})
		->join('students', 'users.id', '=', 'students.user_id')
		->join('pensum_records', 'students.id', '=', 'pensum_records.student_id')
		->join('pensums', 'pensum_records.pensum_id', '=', 'pensums.id')
		->where('pensums.id', $pensum_id)
		->orderBy('firstname', 'asc')->get();		
		return Response::json($users);
	}
	public function searchStudentGlobal()
	{
		$value = Input::get("value");
		$users = User::where(function ($query) use ($value){
		    $query->orWhere('firstname', 'like', '%'.$value.'%');
		    $query->orWhere('lastname', 'like', '%'.$value.'%');
		    $query->orWhere('email', 'like', '%'.$value.'%');
		    $query->orWhere('gender', 'like', '%'.$value.'%');
		    $query->orWhere('phone', 'like', '%'.$value.'%');
		    $query->orWhere('cellphone', 'like', '%'.$value.'%');
		    $query->orWhere('address', 'like', '%'.$value.'%');
		    $query->orWhere('identity_card', 'like', '%'.$value.'%');
		    $query->orWhere('occupation', 'like', '%'.$value.'%');
		    $query->orWhere('contact_person', 'like', '%'.$value.'%');
		    $query->orWhere('contact_person_phone', 'like', '%'.$value.'%');
		    $query->orWhere('contact_person_cellphone', 'like', '%'.$value.'%');
		    $query->orWhere('username', 'like', '%'.$value.'%');
		})
		->join('students', 'students.user_id', '=', 'users.id')
		->orderBy('lastname', 'asc')
		->get(['users.username','users.identity_card','users.firstname','users.lastname','students.id']);		
		return Response::json($users);
	}

	public function searchStudents($value)
	{
/*		    $query->orWhere('contact_person', 'like', '%'.$value.'%');*/
		$users = User::where(function ($query) use ($value){
		    $query->orWhere('firstname', 'like', '%'.$value.'%');
		    $query->orWhere('lastname', 'like', '%'.$value.'%');
		    $query->orWhere('email', 'like', '%'.$value.'%');
		    $query->orWhere('gender', 'like', '%'.$value.'%');
		    $query->orWhere('phone', 'like', '%'.$value.'%');
		    $query->orWhere('cellphone', 'like', '%'.$value.'%');
		    $query->orWhere('address', 'like', '%'.$value.'%');
		    $query->orWhere('identity_card', 'like', '%'.$value.'%');
		    $query->orWhere('occupation', 'like', '%'.$value.'%');
		    $query->orWhere('contact_person_phone', 'like', '%'.$value.'%');
		    $query->orWhere('contact_person_cellphone', 'like', '%'.$value.'%');
		    $query->orWhere('username', 'like', '%'.$value.'%');
		})
		->join('students', 'students.user_id', '=', 'users.id')
		->orderBy('lastname', 'asc')
		->get(['users.*','students.id as student_id']);		
		return Response::json($users);
	}


	public function getInfoStudents()
	{
		$students = User::join('students', 'students.user_id', '=', 'users.id')
						->get(['users.username', 'users.firstname','users.lastname', 'students.id'])->toArray();
		$array = array();
		foreach ($students as $student) {
			array_push($array, array(
					'username' =>$student['username'],
					'fullname' => $student['lastname']. ' ' . $student['firstname'],
					'id' => $student['id']
			));
		}
		return Response::json($array);
	}
	public function pensumRecordsByStudent($student_id)
	{
		$pensum_records = PensumRecord::join('pensums', 'pensums.id','=','pensum_records.pensum_id')
										->where('pensum_records.student_id', $student_id)
										->get(['pensums.name as pensum_name', 'pensum_records.id']);
		return Response::json($pensum_records);
	}
	public function pensumsByUser($user_id)
	{
		$student = Student::where('user_id', $user_id)->firstOrFail();
		$pensums = $student->pensumRecords()
							->join('pensums', 'pensums.id',  '=', 'pensum_records.pensum_id')
							->get(['pensums.*', 'pensum_records.id as pensum_record_id']);
		return Response::json($pensums);
	}
	public function pensumsByStudent($student_id)
	{
		$pensums = Student::find($student_id)->pensumRecords()
							->join('pensums', 'pensums.id',  '=', 'pensum_records.pensum_id')
							->get(['pensums.*']);
		return Response::json($pensums);
	}

	public function groupsByPensumRecordByUser($pensum_record_id, $user_id)
	{
		$student = Student::where('user_id', $user_id)->firstOrFail();
		$group = Record::where('student_id', $student->id)
					->where('pensum_record_id', $pensum_record_id)
					->firstOrFail()
					->group()
					->firstOrFail(['groups.*']);
		$group['user'] = Teacher::find($group->teacher_id)->user()->with('Teacher')->firstOrFail()->toArray();

		return Response::json($group);
	}

/*	public function academicFollowByPensumRecord($pensum_record_id)
	{
		$data = PensumRecord::find($pensum_record_id)->records()
							->join('item_marks', 'item_marks.record_id', '=', 'records.id')
							->join('information_marks', 'information_marks.id', '=', 'item_marks.information_mark_id')
							->join('category_marks', 'category_marks.id', '=', 'information_marks.category_mark_id')
							->join('exam_types', 'exam_types.id', '=', 'category_marks.exam_type_id')
							->orderBy('exam_types.description', 'asc')
							->orderBy('category_marks.description', 'asc')							
							->get([
									'item_marks.*', 
									'information_marks.category_mark_id', 
									'category_marks.description as category_mark_description', 									
									'category_marks.percentage as category_mark_percentage', 									
									'exam_types.description as exam_type_description',
									'exam_types.percentage as exam_type_percentage'
									]);
		return Response::json($data);
	}*/
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
		$bimester = Record::find($record_id)->bimester()->firstOrFail()->toArray();
		$group = Record::find($record_id)->group()->firstOrFail()->toArray();
		$obs = "";
		if ($average >= 70) {
			$obs = "PASS";
		}else{
			$obs = 'FAIL';
		}
		$array = array(
			'final_score' => $average,
			'bimester' => $bimester['name'],
			'group' => $group['name'],
			'obs' => $obs
		);
		return $array;
	}

	public function academicFollowByPensumRecord($pensum_record_id)
	{
		$scores = array();
		$records = PensumRecord::find($pensum_record_id)->records()->orderBy('id','asc')->get();
		foreach ($records as $record) {
			array_push($scores, $this->finalScoreByRecord($record->id));
		}
		return Response::json($scores);
	}

	public function academicHistorialByPensumRecord($pensum_record_id)
	{
		$scores = array();
		$records = PensumRecord::find($pensum_record_id)->records()->orderBy('id','asc')->get();
		foreach ($records as $record) {
			$data = $this->finalScoreByRecord($record->id);
			if ($data['final_score'] >= 70) {
				array_push($scores, $data);
			}	
		}
		return Response::json($scores);
	}


	public function scoresByRecord($record_id)
	{
			  $data = Record::select(DB::raw('
			  				exam_types.description as exam, 
			  				exam_types.percentage as exam_percentage, 
			  				category_marks.description as category, 
			  				category_marks.percentage as category_mark_percentage, 			  				
			  				avg(item_marks.score)*category_marks.percentage/100 as nota_parcial,
			  				avg(item_marks.score)*category_marks.percentage*exam_types.percentage/10000 as nota,
							count(item_marks.score) as num_exams
			  				'))
			  				->join('item_marks', 'item_marks.record_id', '=', 'records.id')
							->join('information_marks', 'information_marks.id', '=', 'item_marks.information_mark_id')
							->join('category_marks', 'category_marks.id', '=', 'information_marks.category_mark_id')
							->join('exam_types', 'exam_types.id', '=', 'category_marks.exam_type_id')
							->where('records.id', $record_id)
							->groupBy('category_marks.id')
							->orderBy('exam_types.description', 'asc')
							->orderBy('category_marks.description', 'asc')							
							->get();
		return Response::json($data);

	}
	public function detailedScoresByRecord($record_id)
	{
	  $data = Record::select(DB::raw('
	  				exam_types.description as exam, 
	  				exam_types.percentage as exam_percentage, 
	  				category_marks.description as category, 
	  				category_marks.percentage as category_mark_percentage, 			
	  				information_marks.end_date,
	  				information_marks.title,
	  				information_marks.description,
	  				item_marks.score   				
	  				'))
	  				->join('item_marks', 'item_marks.record_id', '=', 'records.id')
					->join('information_marks', 'information_marks.id', '=', 'item_marks.information_mark_id')
					->join('category_marks', 'category_marks.id', '=', 'information_marks.category_mark_id')
					->join('exam_types', 'exam_types.id', '=', 'category_marks.exam_type_id')
					->where('records.id', $record_id)
					->orderBy('information_marks.end_date', 'asc')
					->get();
		return Response::json($data);
	}
	public function recordByGroupByUser($group_id, $user_id)
	{
		$student = Student::where('user_id', $user_id)->firstOrFail();
//		$bimester = Bimester::where('progress', true)->firstOrFail();
		$record = Record::where('student_id', $student->id)
				->where('group_id', $group_id)
//				->where('bimester_id', $bimester->id)
				->firstOrFail();
		return Response::json($record);
	}
	public function getStudent($id)
	{
		$usuario = Student::find($id)->user()->firstOrFail();
		return Response::json($usuario);		
	}
}
?>