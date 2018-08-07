<?php 
/**
* 
*/
class AdministrativeCustomController extends BaseController
{
	public function searchAdministrative()
	{
		$value = Input::get("value");
		$administratives = Administrative::where(function ($query) use ($value){
		    $query->orWhere('firstname', 'like', '%'.$value.'%');
		    $query->orWhere('lastname', 'like', '%'.$value.'%');
		    $query->orWhere('email', 'like', '%'.$value.'%');
		    $query->orWhere('gender', 'like', '%'.$value.'%');
		    $query->orWhere('phone', 'like', '%'.$value.'%');
		    $query->orWhere('cellphone', 'like', '%'.$value.'%');
		    $query->orWhere('address', 'like', '%'.$value.'%');
		    $query->orWhere('identity_card', 'like', '%'.$value.'%');
		    $query->orWhere('occupation', 'like', '%'.$value.'%');
		    $query->orWhere('contact_person', 'like', '%'.$value.'%');
		    $query->orWhere('contact_person_phone', 'like', '%'.$value.'%');
		    $query->orWhere('contact_person_cellphone', 'like', '%'.$value.'%');
		    $query->orWhere('username', 'like', '%'.$value.'%');
		})->orderBy('firstname', 'asc')->get();

		return Response::json($administratives);
/*		if (count($users) != 0) {
			return Response::json($users);
		}else{
			return Response::json(array(
				'error' => 'No se encontraron coincidencias'
			));			
		}*/

	}	

}
?>