<?php

class AttendanceController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return Response::json(Attendance::where('record_date', date('Y-m-d'))->with('user')->orderBy('id', 'asc')->get());
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
		$input = array(
				'user_id' => Input::get('id'),
				'record_type' => Input::get('record_type'),
				'record_date' => date('Y-m-d'),
				'record_time' => date('H:i:s')
		);
		$attendance = Attendance::create($input);
		return Response::json(array(
			'user' => array(
				'identity_card' => Input::get('identity_card'),
			),
			'record_type' => $input['record_type'],
			'record_date' => $input['record_date'],
			'record_time' => $input['record_time']
		));
	}


	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		return Response::json(Attendance::find($id));
	}


	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$attendance = Attendance::find($id);
		$attendance->fill(Input::all());
		$attendance->save();
		return Response::json($attendance);
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		Attendance::destroy($id);
		return Response::json(array('error' => 'Asistencia eliminada exitosamente'));
	}


	public function informationByUser($username, $code)
	{
		$credentials = array(
				'username' => $username,
				'password' => $code
		);
		if (Auth::attempt($credentials, false)) {
			return  Response::json(Auth::user());
		}else{
			return Response::json(array('error' => 'Cuenta o codigo incorrecto'));
		}
//		return Response::json($info);
	}
}
