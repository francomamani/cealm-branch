<?php

class PlanController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return Response::json(Plan::paginate(15));
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
		try {
			$file = Input::file("file");
			$originalname = $file->getClientOriginalName();
			$extension = substr($originalname, -4);
			$filename = str_random(16).$extension; 
			$file->move('public/uploads/', $filename);
			$url = 'uploads/'.$filename;

			$plan = new Plan();
			$plan->teacher_id = Auth::user()->id; //just for teachers
			$plan->subject = Input::get('subject');
			if (Input::get('student_id')){
			    $plan->student_id = Input::get('student_id');
            }
			$plan->url = $url;
			$plan->send_date = date('Y-m-d H:i:s');
			$plan->save();

			return Response::json($plan);
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


}
