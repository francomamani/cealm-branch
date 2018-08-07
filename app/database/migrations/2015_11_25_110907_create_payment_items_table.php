<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePaymentItemsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('payment_items', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('payment_id')->unsigned();
			$table->foreign('payment_id')->references('id')->on('payments')->onDelete('cascade');
			$table->integer('payment_type_id')->unsigned();
			$table->foreign('payment_type_id')->references('id')->on('payment_types')->onDelete('cascade');
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
		Schema::drop('payment_items');
	}

}
