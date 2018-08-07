<?php

class CategoryController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return Response::json(Category::get());
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
		$description = Input::get('description'); 
		$acronym = substr($description, 0, 1);
		$category = new Category(); 
		$category->language_id = Input::get('language_id'); 
		$category->description = $description;
		$category->acronym = $acronym;
		$category->save(); 
		return Response::json(array('success'=>'Categoria registrada exitosamente')); 
	}


	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		return Response::json(Category::find($id));
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
		$description = Input::get('description');
		$acronym = substr($description,0,1);
		$category = Category::find($id);
		$category->description = $description;  
		$category->acronym = $acronym;  
		$category->save();  
		return Response::json($category);
/*		return Response::json(array('success'=>"La categoria fue actualizada exitosamente"));*/
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		Category::destroy($id);
		return Response::json(array('success' => 'Categoria eliminada exitosamente'));
	}


}
