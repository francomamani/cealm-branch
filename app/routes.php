<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

Route::get('logout', array('uses' => 'AuthenticationController@postLogout'));

Route::group(array('prefix' => 'api/v1'), function(){
	//auth
	Route::group( array('prefix' => 'auth'), function (){
		Route::get('/',function (){return Response::json(Auth::user());});
		Route::post('reset_password', 'UserCustomController@resetPassword');
		Route::resource('deposits', 'DepositController');
		Route::resource('deposit_items', 'DepositItemController');
		Route::resource('deposit_types', 'DepositTypeController');
		Route::resource('payments', 'PaymentController');
		Route::resource('payment_types', 'PaymentTypeController');
		Route::resource('payment_items', 'PaymentItemController');
		Route::get('payment_items_by_payment/{payment_id}', 'PaymentItemController@paymentItemsByPayment');

		Route::resource('attendances', 'AttendanceController');
		Route::get('information_by_user/{username}/{code}', 'AttendanceController@informationByUser');

		Route::get('deposit_items_by_deposit/{deposit_id}', 'DepositItemController@depositItemsByDeposit');

		Route::resource('rooms','RoomController');
		Route::resource('prices', 'PriceController');		
		Route::resource('users', 'UserController');
		Route::resource('controls','ControlController');
		Route::resource('students','StudentController');
		Route::resource('teachers','TeacherController');
		Route::resource('administratives','AdministrativeController');
		Route::resource('administrators','AdministratorController');
		Route::resource('groups','GroupController');
/*		Route::resource('schedules', 'ScheduleController');
		Route::resource('schedule_records', 'ScheduleRecordController');*/
		Route::resource('years', 'YearController');
		Route::resource('tuitions', 'TuitionController');
		
		Route::get('groups_by_bimester_standard/{bimester_id}', 'GroupCustomController@groupsByBimesterStandard');
		Route::get('groups_by_bimester/{teacher_id}/{bimester_id}', 'GroupCustomController@groupsByBimester');
		Route::get('students_by_group/{group_id}', 'GroupCustomController@studentsByGroup');
		Route::get('students_by_group_clean/{group_id}', 'GroupCustomController@studentsByGroupClean');
		Route::get('students_tuition_by_group/{group_id}', 'GroupCustomController@studentsTuitionByGroup');

		Route::get('group_scores/{group_id}', 'GroupCustomController@groupScores');

		Route::get('paid_tuitions/{group_id}', 'GroupCustomController@paidTuitions');
		Route::get('unpaid_tuitions/{group_id}', 'GroupCustomController@unpaidTuitions');
	
		Route::get('teacher_by_group/{group_id}', 'GroupCustomController@teacherByGroup');
		Route::get('information_marks_by_group/{group_id}', 'GroupCustomController@informationMarksByGroup');
		
		Route::get('groups_by_teacher', 'GroupCustomController@groupsByTeacher');

		Route::get('current_groups/{bimester_id}', 'GroupCustomController@currentGroups');
		Route::get('current_groups_by_pensum/{pensum_id}', 'GroupCustomController@currentGroupsByPensum');
		Route::get('exam_types_by_group/{group_id}', 'GroupCustomController@examTypesByGroup');
		Route::get('exams_by_group/{group_id}', 'GroupCustomController@examsByGroup');
		Route::get('categories_by_group/{group_id}', 'GroupCustomController@categoriesByGroup');
		
		Route::get('category_marks_by_exam_type/{exam_type}', 'ExamTypeCustomController@categoryMarksByExamType');
		
/*		Route::get('current_schedules/{bimester_id}', 'ScheduleCustomController@currentSchedules');
		Route::get('complete_schedule/{bimester_id}', 'ScheduleCustomController@completeSchedule');
		Route::get('schedule_by_group/{group_id}', 'ScheduleCustomController@scheduleByGroup');*/

		Route::post('search_users', 'UserCustomController@searchUsers');
		Route::post('assign_roles', 'UserCustomController@assignRoles');

		Route::resource('bimesters', 'BimesterController');
		Route::get('bimesters_by_year/{year_id}', 'BimesterCustomController@bimestersByYear');
		Route::get('setcurrentbimester/{id}', 'BimesterCustomController@setCurrentBimester');
		Route::get('getcurrentbimester', 'BimesterCustomController@getCurrentBimester');

		Route::put('update_password', 'AuthenticationController@updatePassword');
		Route::put('update_role', 'UserCustomController@updateRole');
		Route::post('register', 'AuthenticationController@postRegister'); 
		Route::post('register_student', 'AuthenticationController@registerStudent'); 
		
		Route::post('register_teacher', 'AuthenticationController@registerTeacher');

		Route::post('login', 'AuthenticationController@postLogin');
		Route::get('logout', 'HomeController@getLogout');
		Route::get('roles', 'AuthenticationController@getRoles');
		Route::get('user_roles/{id}', 'UserCustomController@getUserRoles');


		Route::post('search_students', 'StudentCustomController@searchStudent');
		Route::post('search_students_global', 'StudentCustomController@searchStudentGlobal');
		Route::get('get_info_students', 'StudentCustomController@getInfoStudents');
		Route::get('get_search_students/{value}', 'StudentCustomController@searchStudents');
		Route::get('get_student/{id}', 'StudentCustomController@getStudent');

		Route::get('search_deposit_types/{value}', 'DepositTypeController@searchDepositTypes');
		/*new payment*/
		Route::get('search_payment_types/{value}', 'PaymentTypeController@searchPaymentTypes');

		Route::post('search_teachers', 'TeacherCustomController@searchTeacher');
		Route::post('search_administratives', 'AdministrativeCustomController@searchAdministrative');
		Route::post('search_administrators', 'AdministratorCustomController@searchAdministrator');

		Route::get('current_teacher', 'UserCustomController@currentTeacher');
		//Route::post('upload_plan', 'UploadController@plan');	
		/*pensums*/
		Route::resource('pensums', 'PensumController');
		Route::resource('subjects', 'SubjectController');
		Route::resource('levels', 'LevelController');
		Route::resource('planes', 'PlanController');
		Route::resource('students', 'StudentController');
		Route::resource('pensum_records', 'PensumRecordController');
		Route::resource('records', 'RecordController');
		Route::resource('languages', 'LanguageController');
		Route::resource('categories', 'CategoryController');
		Route::resource('exam_types', 'ExamTypeController');
		Route::resource('category_marks', 'CategoryMarkController');
		Route::resource('information_marks', 'InformationMarkController');
		Route::resource('item_marks', 'ItemMarkController');
		Route::resource('cover_images', 'CoverImageController');
		Route::resource('documents_reception', 'DocumentReceptionController');
		Route::resource('documents', 'DocumentController');

		Route::resource('balances', 'BalanceController');

		Route::resource('balances.deposits', 'BalanceDepositController');
		Route::resource('balances.payments', 'BalancePaymentController');
		Route::post('cerrar_balance/{balance_id}', 'BalanceController@cerrarBalance');

		Route::get('get_documents/{document_reception_id}', 'DocumentController@getDocuments');
		Route::get('get_document_reception/{student_id}', 'DocumentReceptionController@getDocumentReception');

		Route::get('item_mark_by_two/{record_id}/{information_mark_id}', 'ItemMarkCustomController@itemMarkByTwo');

		Route::get('my_plans', 'PlanCustomController@myPlans');
		Route::get('all_plans', 'PlanCustomController@allPlans');
		Route::get('bimesters_by_pensum/{id}', 'PensumCustomController@bimestersByPensum');
		Route::get('subjects_by_pensum/{id}', 'PensumCustomController@subjectsByPensum');
		Route::get('subjects_by_bimester/{pensum_id}/{bimester}', 'PensumCustomController@subjectsByBimester');
		Route::get('get_subjects/{pensum_id}', 'PensumCustomController@getSubjects');

		Route::get('pensum_record_by_student_by_pensum/{student_id}/{pensum_id}', 'PensumCustomController@pensumRecordByStudentByPensum');

		Route::get('categories_by_language/{language_id}', 'LanguageCustomController@categoriesByLanguage');

		Route::get('teacher_groups_by_bimester/{teacher_id}/{bimester_id}', 'BimesterCustomController@teacherGroupsByBimester');

		Route::get('current_groups_by_teacher', 'BimesterCustomController@currentGroupsByTeacher');
		/*student*/
		Route::get('pensums_by_student/{student_id}', 'StudentCustomController@pensumsByStudent');
		Route::get('groups_by_pensum_record_by_user/{pensum_record_id}/{user_id}', 'StudentCustomController@groupsByPensumRecordByUser');
		Route::get('pensums_by_user/{user_id}', 'StudentCustomController@pensumsByUser');
		Route::get('pensum_records_by_student/{student_id}', 'StudentCustomController@pensumRecordsByStudent');
/*		Route::get('final_score_by_record/{record_id}', 'StudentCustomController@finalScoreByRecord');*/
		Route::get('academic_follow_by_pensum_record/{pensum_record_id}', 'StudentCustomController@academicFollowByPensumRecord');		
		Route::get('academic_historial_by_pensum_record/{pensum_record_id}', 'StudentCustomController@academicHistorialByPensumRecord');
		Route::get('scores_by_record/{record_id}', 'StudentCustomController@scoresByRecord');
		Route::get('detailed_scores_by_record/{record_id}', 'StudentCustomController@detailedScoresByRecord');
		Route::get('record_by_group_by_user/{group_id}/{user_id}', 'StudentCustomController@recordByGroupByUser');

		Route::post('statistics', 'ReportController@statistics');
		Route::get('render_structure/{group_id}', 'ReportController@renderStructure');
		/*Queries*/
		Route::post('queries', 'QueryController@queries');
		Route::post('expenses', 'QueryController@expenses');

		Route::get('balance/{month}/{year}', 'QueryController@balance');
		Route::get('income/{month}/{year}', 'QueryController@income');
		Route::get('expenditure/{month}/{year}', 'QueryController@expenditure');

		Route::post('search_attendances', 'QueryController@searchAttendances');


		/*incomes*/
		Route::get('current_balance', 'BalanceController@currentBalance');

		/*queries personalizadas*/

		Route::post('consultar-ingreso', 'QueryController@consultarIngreso');
		Route::post('consultar-egreso', 'QueryController@consultarEgreso');

		Route::get('detalle-ingreso/{balance_id}', 'QueryController@detalleIngreso');
		Route::get('detalle-egreso/{balance_id}', 'QueryController@detalleEgreso');
		Route::get('consultar-saldo/{balance_id}', 'QueryController@consultarSaldo');
		Route::get('get-pensum/{group_id}', 'GroupController@getPensum');
	});
});
App::missing(function()
{
	return Redirect::to("/");
});

Route::get('/', function()
{
	return View::make('home');
});
