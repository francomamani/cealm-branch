<?php

use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableInterface;
use Illuminate\Database\Eloquent\SoftDeletingTrait;
class User extends Eloquent implements UserInterface, RemindableInterface {


//	use SoftDeletingTrait;

	protected $dates = ['deleted_at'];
	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'users';

	/**
	 * The attributes excluded from the model's JSON form.
	 *
	 * @var array
	 */
	protected $hidden = array('password');

	/**
	 * Get the unique identifier for the user.
	 *
	 * @return mixed
	 */
	public function getAuthIdentifier()
	{
		return $this->getKey();
	}

	/**
	 * Get the password for the user.
	 *
	 * @return string
	 */
	public function getAuthPassword()
	{
		return $this->password;
	}

	/**
	 * Get the e-mail address where password reminders are sent.
	 *
	 * @return string
	 */
	public function getReminderEmail()
	{
		return $this->email;
	}

	public function getRememberToken(){
    	return $this->remember_token;
	}

	public function setRememberToken($value){
    	$this->remember_token = $value;
	}

	public function getRememberTokenName(){
	    return 'remember_token';
	}
	
	public function student()
	{
		return $this->hasOne('Student');
	}
	public function teacher()
	{
		return $this->hasOne('Teacher');
	}
	public function payments()
	{
		return $this->hasMany('Payment');
	}
	public function attendances()
	{
		return $this->hasMany('Attendance');
	}
}