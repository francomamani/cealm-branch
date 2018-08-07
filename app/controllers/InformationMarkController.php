<?php

class InformationMarkController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return Response::json(InformationMark::get());
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
		$informationMark = InformationMark::create(Input::all());
		return Response::json($informationMark);
	}


	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		return Response::json(InformationMark::find($id));
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
		$informationMark = InformationMark::find($id);
		$informationMark->category_mark_id = Input::get("category_mark_id"); 
		$informationMark->exam_type_id = Input::get("exam_type_id"); 
		$informationMark->group_id = Input::get("group_id"); 
		$informationMark->title = Input::get("title") ; 
		$informationMark->description = Input::get("description"); 
		$informationMark->start_date = Input::get("start_date"); 
		$informationMark->end_date = Input::get("end_date"); 
		$informationMark->save(); 
		return Response::json(array("success" => "Informacion de nota actualizada"));
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		InformationMark::destroy($id);
		return Response::json(array("success" => "Informacion de nota eliminada"));
	}


}
