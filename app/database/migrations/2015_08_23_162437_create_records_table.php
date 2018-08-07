<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRecordsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('records', function(Blueprint $table)
		{
			$table->increments('id');
/*			$table->integer('following_id')->unsigned();
			$table->foreign('following_id')->references('id')->on('academic_followings')->onDelete('cascade');
			$table->integer('historical_id')->unsigned();
			$table->foreign('historical_id')->references('id')->on('academic_historicals')->onDelete('cascade');*/
			$table->integer('bimester_id')->unsigned();
			$table->foreign('bimester_id')->references('id')->on('bimesters')->onDelete('cascade');

			$table->integer('pensum_record_id')->unsigned();
			$table->foreign('pensum_record_id')->references('id')->on('pensum_records')->onDelete('cascade');

			$table->integer('group_id')->unsigned();
			$table->foreign('group_id')->references('id')->on('groups')->onDelete('cascade');
			$table->integer('student_id')->unsigned();
			$table->foreign('student_id')->references('id')->on('students')->onDelete('cascade');
			$table->float('final_score');
			$table->string('observations');
			$table->timestamps();
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('records');
	}

}
