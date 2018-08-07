<?php 
/**
* 
*/
class ItemMarkCustomController extends \BaseController
{
	
	public function itemMarkByTwo($record_id, $information_mark_id)
	{
		$item = ItemMark::where('record_id', $record_id)
				->where('information_mark_id', $information_mark_id)
				->firstOrFail();
		return Response::json($item);
	}
}

?>