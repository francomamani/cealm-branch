<?php

class LanguageController extends \BaseController {

	public function spanishName($name)
	{
		switch ($name) {
			case 'INGLES':
				return 'Inglés';
				break;
			case 'INGLÉS':
				return 'Inglés';
				break;
			case 'ENGLISH':
				return 'Inglés';
				break;
			case 'FRANÇAIS':
				return 'Francés';
				break;
			case 'FRENCH':
				return 'Francés';
				break;
			case 'ALEMÁN':
				return 'Alemán';
				break;				
			case 'DEUTSCH':
				return 'Alemán';
				break;
			case 'GERMAN':
				return 'Alemán';
				break;
			case 'PORTUGUÉS':
				return 'Portugués';
				break;
			case 'PORTUGUES':
				return 'Portugués';
				break;
			case 'PORTUGUESE':
				return 'Portugués';
				break;
			case 'RUNASIMI':
				return 'Quechua';
				break;
			case 'QUECHUA':
				return 'Quechua';
				break;
			case 'AYMARA':
				return 'Aymara';
				break;
			default: 
				return $name;
				break;
		}
	}
	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
		return Response::json(Language::get());
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
		$name = Input::get('name');
//		$spanish_name = $this->spanishName($name);
		$spanish_name = $name;
		$acronym = substr($name, 0,3);
		$language = new Language();
		$language->name = $name;
		$language->spanish_name = $spanish_name;
		$language->acronym = Input::get('acronym');
		$language->save();
		return Response::json(array('success'=> 'Idioma registrado'));
	}


	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		return Response::json(Language::find($id));
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
		$name = Input::get('name');
		$spanish_name = $name;
		$acronym = substr($name, 0, 3);
		$language = Language::find($id);
		$language->name = $name;
		$language->spanish_name = $spanish_name;		
		$language->acronym = Input::get('acronym');
		$language->save();
		return Response::json($language);
		return Response::json(array('success'=> 'Idioma actualizado'));
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$pensums = Language::select(DB::raw('count(*) as quantity'))
							->join('pensums', 'pensums.language_id', '=', 'languages.id')
							->where('languages.id', $id)
							->firstOrFail()->toArray();

		if ($pensums['quantity'] == 0) {
			Language::destroy($id);
			return Response::json(array('success' => 'Idioma eliminado exitosamente'));
		}else{
			return Response::json(array('error' => 'Existen pensums registrados para este idioma'));

		}

	}


}
