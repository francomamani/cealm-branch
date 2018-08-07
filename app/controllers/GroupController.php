<?php

class GroupController extends \BaseController {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function index()
	{
	    $groups = Group::with('subject.pensum')->orderby('name', 'asc')->get();
		return Response::json($groups, 200);
	}


	/**
	 * Store a newly created resource in storage.
	 *
	 * @return Response
	 */
	public function store()
	{
	    $registros = Group::where('teacher_id', Input::get('teacher_id'))
                            ->where('subject_id', Input::get('subject_id'))
                            ->where('bimester_id', Input::get('bimester_id'))
                            ->count();

	    $restriccion = Group::where('room_id', Input::get('room_id'))
                            ->where('teacher_id', '<>', Input::get('teacher_id'))
                            ->where('from', Input::get('from'))
                            ->where('to', Input::get('to'))
                            ->count();
	    if ($registros == 0 && $restriccion == 0) {
            $group = Group::create(Input::all());
            $parallel = Bimester::join('groups', 'groups.bimester_id', '=', 'bimesters.id')
                ->join('rooms','rooms.id', '=', 'groups.room_id')
                ->join('teachers', 'teachers.id', '=', 'groups.teacher_id')
                ->join('users', 'users.id', '=','teachers.user_id')
                ->where('bimesters.progress', 1)
                ->where('groups.id', $group->id)
                ->orderBy('users.lastname', 'asc')
                ->first([
                    'groups.id as group_id',
                    'users.lastname',
                    'users.firstname',
                    'teachers.type',
                    'users.cellphone',
                    'groups.name as group_name',
                    'groups.from',
                    'groups.to',
                    'rooms.name as room_name'
                ]);
            return Response::json($parallel);
        } else {

	        if ($registros !== 0 ) {
                return Response::json([
                    'error' => 'El grupo ya fue creado con anterioridad'
                ]);
            }
	        if ($restriccion !== 0 ) {
                return Response::json([
                    'error' => 'El aula ya esta en uso'
                ]);
            }

        }

//		return Response::json(array('success'=>""));
	}


	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function show($id)
	{
		return Response::json(Group::find($id));
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update($id)
	{
		$group =  Group::find($id);
        $group->teacher_id = Input::get('teacher_id');
        $group->subject_id = Input::get('subject_id');
        $group->bimester_id = Input::get('bimester_id');
        $group->room_id = Input::get('room_id');
        $group->parallel = Input::get('parallel');
        $group->name = Input::get('name');
        $group->from = Input::get('from');
        $group->to = Input::get('to');
		$group->save();
		return Response::json(array('success' => 'Grupo actualizado existosamente'));
	}


	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function destroy($id)
	{
		$groups = Group::find($id)->records()->count();
		if ($groups == 0) {
			Group::destroy($id);
			return Response::json(array('success' => 'Grupo eliminado exitosamente'));
		}else{
			return Response::json(array('error' => 'Imposible de eliminar existen estudiantes registrados'));			
		}
	}

	public function getPensum($group_id) {
	    $pensum = Group::with('subject.pensum.language')->find($group_id);
	    return Response::json($pensum, 200);
    }
}
