<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTuitionTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('tuitions', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('year_id')->unsigned();
			$table->foreign('year_id')->references('id')->on('years')->onDelete('cascade');
			$table->integer('pensum_record_id')->unsigned();
			$table->foreign('pensum_record_id')->references('id')->on('pensum_records')->onDelete('cascade');
			$table->float('price');
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
		Schema::drop('tuitions');
	}

}
