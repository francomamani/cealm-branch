<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateItemMarksTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('item_marks', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('record_id')->unsigned();
			$table->foreign('record_id')->references('id')->on('records')->onDelete('cascade');			
			$table->integer('information_mark_id')->unsigned();
			$table->foreign('information_mark_id')->references('id')->on('information_marks')->onDelete('cascade');
			$table->string('observation');
			$table->float('score');
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
		Schema::drop('item_marks');
	}

}
