<?php 
/**
* 
*/
class PlanCustomController extends BaseController
{
	public function myPlans()
	{
		$plans = Plan::where('teacher_id', Auth::id())->paginate(15);
		return Response::json($plans);
	}
	public function allPlans()
	{
		$results = array();
		$plans = Plan::get();
		foreach ($plans as $plan) {
			$teacher  = User::find($plan->teacher_id);
			if ($teacher != "") {
				array_push($results, array(
					'teacher' => $teacher->firstname . " " . $teacher->lastname, 
					'cellphone' => $teacher->cellphone, 
					'email' => $teacher->email, 
					'subject' => $plan->subject, 
					'url' => $plan->url, 
					'send_date' => $plan->send_date
				));
			}
		}
		$perPage = 15;
		$pagedData = array_slice($results, 0, $perPage);
		$results = Paginator::make($pagedData, count($results), $perPage);
//		// $currentPage = Input::get('page') - 1;
//		$pagedData = array_slice($results, $currentPage * $perPage, $perPage);

		return Response::json($results);
	}
}
?>