<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Eloquent\SoftDeletingTrait;

class CreateUsersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('users', function (Blueprint $table)
		{
			$table->increments('id');
			$table->string('firstname', 64);
			$table->string('lastname', 64);
			$table->string('email', 320)->nullable();
			$table->date('birthday');
			$table->string('gender');
			$table->string('phone')->nullable();
			$table->string('cellphone');
			$table->string('address');
			$table->string('identity_card', 15);			
			$table->string('occupation');
			$table->string('contact_person');
			$table->string('contact_person_phone')->nullable();
			$table->string('contact_person_cellphone')->nullable();
			$table->string('username', 32);
			$table->string('password', 64);
			$table->string('remember_token', 100)->nullable();
			$table->timestamps();
			$table->softDeletes();
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('users');
	}

}
