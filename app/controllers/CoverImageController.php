<?php

class CoverImageController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return Response::json(CoverImage::orderBy('id', 'desc')->get());
	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$file = Input::file('file');
		$originalname = $file->getClientOriginalName();
		$extension = substr($originalname, -4);
		$filename = str_random(16).$extension; 

		$file->move(base_path() . '/public_html/images/cover_images/', $filename);
		$image_path = '/images/cover_images/' . $filename; 
		$coverimage = CoverImage::create(array(
						'url' => $image_path,
						'description' => Input::get('description')
					  ));
		return Response::json($coverimage);
	}


	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		//
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
		$cover_image = CoverImage::find($id);
		$cover_image->description = Input::get('description');
		$cover_image->save();
		return Response::json('Imagen de Portada Actualizada');
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$cover_image = CoverImage::find($id);
		File::delete(base_path() . '/public_html'. $cover_image->url);
		CoverImage::destroy($id);
		return Response::json('Enhorabuena la imagen fue eliminada');
	}


}
