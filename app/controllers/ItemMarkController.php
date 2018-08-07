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
		$items = ItemMark::where('record_id', Input::get('record_id'))
						->where('information_mark_id', Input::get('information_mark_id'))
						->count();
		if ($items == 0) {
			ItemMark::create(Input::all());
			return Response::json(array('success' => 'Nota Registrada'));
		}else{
			$item_mark = ItemMark::where('record_id', Input::get('record_id'))
							->where('information_mark_id', Input::get('information_mark_id'))
							->firstOrFail();
			$item_mark->observation = Input::get('observation') ;
			$item_mark->score = Input::get('score') ;
			$item_mark->save();
			return Response::json(array('success' => 'Nota Actualizada'));
		}
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
