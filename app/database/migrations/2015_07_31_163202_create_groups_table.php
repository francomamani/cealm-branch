<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGroupsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('groups', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('teacher_id')->unsigned();
			$table->foreign('teacher_id')->references('id')->on('teachers')->onDelete('cascade');
			$table->integer('subject_id')->unsigned();
			$table->foreign('subject_id')->references('id')->on('subjects')->onDelete('cascade');
			$table->integer('bimester_id')->unsigned();
			$table->foreign('bimester_id')->references('id')->on('bimesters')->onDelete('cascade');			

			$table->integer('room_id')->unsigned();
			$table->foreign('room_id')->references('id')->on('rooms')->onDelete('cascade');			

			$table->string('parallel');
			$table->string('name');
			$table->time('from');
			$table->time('to');
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
		Schema::drop('groups');
	}

}
