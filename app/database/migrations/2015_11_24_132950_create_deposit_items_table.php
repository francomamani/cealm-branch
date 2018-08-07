<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDepositItemsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('deposit_items', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('deposit_id')->unsigned();
			$table->foreign('deposit_id')->references('id')->on('deposits')->onDelete('cascade');
			$table->integer('deposit_type_id')->unsigned();
			$table->foreign('deposit_type_id')->references('id')->on('deposit_types')->onDelete('cascade');
			$table->integer('month');
			$table->integer('year');
			$table->float('amount');
			$table->string('additional_information');
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
		Schema::drop('deposit_items');
	}

}
