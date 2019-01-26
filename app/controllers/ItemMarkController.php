<?php

class ItemMarkController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return Response::json(ItemMark::all());
	}


	/**
	 * Show the form for creating a new resource.
	 *
	 * @return Response
	 */
	public function create()
	{
		//
	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
	    $record_id = Input::get('record_id');
		$items = ItemMark::where('record_id', $record_id)
						->where('information_mark_id', Input::get('information_mark_id'))
						->count();
		if ($items == 0) {
			ItemMark::create(Input::all());
//			return Response::json(array('success' => 'Nota Registrada'));
		}else{
			$item_mark = ItemMark::where('record_id', Input::get('record_id'))
							->where('information_mark_id', Input::get('information_mark_id'))
							->firstOrFail();
			$item_mark->observation = Input::get('observation') ;
			$item_mark->score = Input::get('score') ;
			$item_mark->save();
//			return Response::json(array('success' => 'Nota Actualizada'));
		}
		$record = Record::with('itemMarks.informationMark.categoryMark.examType')->find($record_id);
        $finalScore = 0;
		foreach ($record->item_marks as $item_mark) {
		    $count = $item_mark->information_mark->category_mark->information_marks->count();
		    $categoryMark = $item_mark->information_mark->category_mark->percentage;
		    $examType = $item_mark->information_mark->category_mark->exam_type->percentage;
            $finalScore += ((float)$item_mark->score * (float)$categoryMark/100 * (float)$examType/100) / $count;
		}
		$updatedRecord = Record::find($record_id);
		$updatedRecord->final_score = $finalScore;
		$updatedRecord->save();
		return Response::json(['success' => 'Nota registrada', 'final_score' => $finalScore]);
	}


	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		return Response::json(ItemMark::find($id));
	}


	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function edit($id)
	{
		//
	}


	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$item_mark = ItemMark::find($id);
		$item_mark->observation = Input::get('observation') ;
		$item_mark->score = Input::get('score') ;
		$item_mark->save();
		return Response::json(array('success' => 'Nota Actualizada'));
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		ItemMark::destroy($id);
		return Response::json(array('success'=>'Nota Eliminada'));
	}


}
