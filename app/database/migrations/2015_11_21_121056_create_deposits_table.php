<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDepositsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('deposits', function(Blueprint $table)
		{
			$table->increments('id');
			$table->integer('balance_id')->unsigned();
			$table->foreign('balance_id')->references('id')->on('balances')->onDelete('cascade');			
			$table->integer('user_id')->unsigned();
			$table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');			
			$table->float('amount');
			$table->integer('student_id')->unsigned();
			$table->date('deposit_date');
			$table->string('client');
			$table->string('client_identity_card');
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
		Schema::drop('deposits');
	}

}
