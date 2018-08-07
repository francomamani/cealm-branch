<?php

class DocumentController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return Response::json(Document::get());
	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		try {

			$file = Input::file("file");
			$originalname = $file->getClientOriginalName();
			$extension = substr($originalname, -4);
			$filename = str_random(16).$extension; 
			$file->move('public/documents/', $filename);
			$url = 'documents/'.$filename;

			$document = new Document();
			$document->document_reception_id = Input::get('document_reception_id'); //just for teachers
			$document->type = Input::get('type');
			$document->url = $url;
			$document->save();

			return Response::json($document);
/*			return Response::json($arrayName = array(
				'message' => "Archivo enviado exitosamente :D", 
			));*/
					
		} catch (Exception $e) {
			return Response::json(array(
				'error' => $e->getMessage() 
			));
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
		//
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		//
	}

	public function getDocuments($document_reception_id)
	{
		$documents = DocumentReception::find($document_reception_id)->documents()->get();
		return Response::json($documents);
	}
}
