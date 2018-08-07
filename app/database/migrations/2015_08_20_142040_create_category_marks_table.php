<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCategoryMarksTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('category_marks', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('exam_type_id')->unsigned();
			$table->foreign('exam_type_id')->references('id')->on('exam_types')->onDelete('cascade');
			$table->string('description');
			$table->integer('percentage');
			$table->string('acronym');
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
		Schema::drop('category_marks');
	}

}
