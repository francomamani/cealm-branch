<?php 
/**
* 
*/
class GroupCustomController extends BaseController
{
	public function groupsByBimester($teacher_id, $bimester_id)
	{		
		return Response::json(Teacher::find($teacher_id)->groups()->where('bimester_id', $bimester_id)->get());
	}
	public function currentGroups($bimester_id)
	{
		return Response::json(Bimester::find($bimester_id)->groups()->with('subject.pensum')->orderBy('name', 'asc')->get());
	}

	public function currentGroupsByPensum($pensum_id)
	{
		$bimester = Bimester::where('progress', true)->firstOrFail();

		$groups = Group::where('bimester_id', $bimester->id)
						->join('subjects', 'groups.subject_id', '=', 'subjects.id')
						->join('pensums', 'subjects.pensum_id', '=', 'pensums.id')
						->where('pensums.id', $pensum_id)
						->orderBy('groups.name', 'asc')
						->get(['groups.*']);
		return Response::json($groups);
	}
/*		I wanna get all of tuitions which are paid*/
	public function paidTuitions($group_id)
	{
		$records = Group::find($group_id)->records()
					->with('Group')
					->join('tuitions', 'tuitions.pensum_record_id', '=', 'records.pensum_record_id')
					->join('students', 'students.id', '=', 'records.student_id')
					->join('users', 'users.id', '=' , 'students.user_id')
					->get(['tuitions.*',
						 'users.firstname',
						 'users.lastname',
						 'users.contact_person'
					]);
		return Response::json($records);
	}
	public function unpaidTuitions($group_id)
	{
		$students = array();
		$records = Group::find($group_id)->records()
						->join('students', 'students.id', '=' , 'records.student_id')
						->join('users', 'users.id', '=', 'students.user_id')
						->get(['users.*', 'records.pensum_record_id', 'records.student_id']);
		foreach ($records as $record) {
			$tuitions = Tuition::where('pensum_record_id', $record->pensum_record_id)->count();
			if ($tuitions == 0) {
				$record['tuition'] = array('price'=> 0);
				array_push($students, $record->toArray());
			}else{
				$record['tuition'] = Tuition::where('pensum_record_id', $record->pensum_record_id)->firstOrFail();
			}
		}
		return Response::json($students);						
	}

	public function studentsByGroup($group_id)
	{
		$records = Group::find($group_id)->records()->get();
		$counter = 0;
		$student_list = array();
		$results = array();
		foreach ($records as $record) {
			$pensum_record = PensumRecord::find($record->pensum_record_id);
			$student = Student::find($pensum_record->student_id);
			$user = User::find($student->user_id);
			$data = array(
				'number' => 0, 
				'record' => $record['attributes'],
				'info' => $user['attributes']
			);
			array_push($student_list, $data);
		}
		usort($student_list, function ($a, $b)
		{
			return strcmp($a["info"]["lastname"], $b["info"]['lastname']);
		});

		foreach ($student_list as $record) {
			$counter++;
			$record['number'] = $counter;
			array_push($results, $record);
		}

		return Response::json($results);
	}
	public function teacherByGroup($group_id)
	{
		$group = Group::find($group_id);
		$teacher = Teacher::find($group->teacher_id);
		$info = User::find($teacher->user_id);
		return Response::json($info);
	}

	public function groupsByTeacher()
	{
		$user = Auth::user();
		$bimester = Bimester::where('progress', true)->firstOrFail();
		$groups = Teacher::where('user_id', $user->id)
					->firstOrFail()
					->groups()
					->where('bimester_id', $bimester->id)
					->orderBy('name', 'asc')->get();

		foreach ($groups as $group) {
			$array =  array();
			array_push($array, Level::where('subject_id', $group->subject_id)->get()[0]['attributes']);
			array_push($array, Level::where('subject_id', $group->subject_id)->get()[1]['attributes']);
			$group->levels = $array;
		}
		return Response::json($groups);
	}
	public function examsByGroup($group_id)
	{
		return Response::json(Group::find($group_id)->examTypes()->get());
	}
	public function examTypesByGroup($group_id)
	{
		return Response::json(Group::find($group_id)->examTypes()->get());
	}
	public function examTypesByGroup2($group_id)
	{
		$results = array(
			"total_percentage" => 0, 
			"data" => array()
		);
		$exam_types = Group::find($group_id)->examTypes()->get();
		foreach ($exam_types as $exam_type) {
			$result = array(
				'id' => '',
				'group_id' => '',
				'description' => '',
				'percentage' => '',
				'acronym' => '',
				'score' => '',
				'total_percentage' => 0,
				'category_marks' => array()
			);
			$result['id'] = $exam_type->id;
			$result['group_id'] = $exam_type->group_id;
			$result['description'] = $exam_type->description;
			$result['percentage'] = $exam_type->percentage;
			$result['acronym'] = $exam_type->acronym;
			$results['total_percentage'] += $exam_type->percentage;
			$category_marks = ExamType::find($exam_type->id)->categoryMarks()->orderBy('description', 'asc')->get();
			foreach ($category_marks as $category_mark) {

				array_push($result['category_marks'], $category_mark['attributes']);
				$result['total_percentage'] += $category_mark['attributes']['percentage'];
			}
			array_push($results['data'], $result); 
		}
		return Response::json($results);
	}
	public function categoriesByGroup($group_id)
	{
		$group = Group::find($group_id);
		$subject_id = $group->subject_id;
		$subject = Subject::find($subject_id);
		$pensum = Pensum::find($subject->pensum_id);
		return Response::json(Language::find($pensum->language_id)->categories()->orderBy('description', 'asc')->get());
	}
	public function informationMarksByGroup($group_id)
	{
		$informationMarks = Group::find($group_id)->informationMarks()->orderBy('end_date', 'asc')->get();
		foreach ($informationMarks as $informationMark) {
			$informationMark->min = $informationMark->itemMarks()->min('score');
			$informationMark->max = $informationMark->itemMarks()->max('score');
			$informationMark->avg = $informationMark->itemMarks()->avg('score');
		}
		return Response::json($informationMarks);
	}

	public function groupsByBimesterStandard($bimester_id)
	{
		$groups = Bimester::find($bimester_id)->groups()->get();
		return Response::json($groups);
	}

}
?>