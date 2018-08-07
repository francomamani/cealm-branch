<?php 
/**
* 
*/
class PensumCustomController extends BaseController
{
	public function bimestersByPensum($id)
	{
		$subjects = array();
		$pensum = Pensum::find($id);
		if ($pensum->id != '') {
			$subjects = Subject::where('pensum_id', $pensum->id)->orderBy('bimester', 'asc')->distinct()->get();
		}
		$bimesters = array();
		for ($i=1; $i <= count($subjects)/2 ; $i++) { 
			array_push($bimesters, $i);
		}
		return Response::json($bimesters);
	}
	public function subjectsByPensum($id)
	{
/*		$subjects = array();
		$pensum = Pensum::find($id);
		if ($pensum->id != '') {
			$subjects = Subject::where('pensum_id', $pensum->id)->orderBy('bimester', 'asc')->distinct()->get();
		}
		return */
		return Response::json(Pensum::find($id)->subjects()->orderBy('bimester', 'asc')->get());
	}

	public function subjectsByBimester($pensum_id, $bimester)
	{
		$bimester = intval($bimester);
		$subjects = Subject::where('pensum_id', $pensum_id)->where('bimester', $bimester)->orderBy('subject_name')->get();
		return Response::json($subjects);
	}

	public function getSubjects($pensum_id)
	{
		$results = array();
		$subjects = Pensum::find($pensum_id)->subjects()->get();
		foreach ($subjects as $subject) {
			$levels = Subject::find($subject['attributes']['id'])->levels()->get();
			$levels_array = array();
			foreach ($levels as $level) {
				array_push($levels_array, $level['attributes']);
			}
			$data = array(
				'subject'=> $subject['attributes'], 
				'levels'=> $levels_array
			);
			array_push($results, $data);
		}
		return Response::json($results);
	}

	public function pensumRecordByStudentByPensum($student_id, $pensum_id)
	{

		$pensum_record = PensumRecord::where('student_id', $student_id)
					  				   ->where('pensum_id', $pensum_id)
					  				   ->firstOrFail();
		return Response::json($pensum_record);

	}
}
?>