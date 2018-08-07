<?php 
/**
* 
*/
class LanguageCustomController extends \BaseController
{
	
	public function categoriesByLanguage($language_id)
	{
		return Response::json(Language::find($language_id)->categories()->orderBy('description', 'asc')->get());
	}
}
?>