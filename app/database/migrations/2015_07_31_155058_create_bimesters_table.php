<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBimestersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('bimesters', function(Blueprint $table)
		{
			$table->increments('id');			
			$table->integer('year_id')->unsigned();
			$table->foreign('year_id')->references('id')->on('years')->onDelete('cascade');
			$table->string('num_bimester');
			$table->string('name');
			$table->boolean('progress')->default(false);			
			$table->date('from');
			$table->date('to');
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
		Schema::drop('bimesters');
	}

}
