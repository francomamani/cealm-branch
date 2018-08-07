<?php 
class QueryController extends BaseController
{
	public function queries()
	{
		$depositTypeId = Input::get("deposit_type_id");
		$data = Input::get("data");
		$month = Input::get("month");
		$year = Input::get("year");
		$depositTypes = DepositType::join('deposit_items', 'deposit_items.deposit_type_id', '=', 'deposit_types.id')
						->join('deposits', 'deposits.id', '=', 'deposit_items.deposit_id')
						->join('students', 'students.id', '=', 'deposits.student_id')
						->join('users', 'users.id', '=', 'students.user_id')
						->where('deposit_types.id', $depositTypeId)
						->where('deposit_items.month', 'like',  '%'.$month.'%')
						->where('deposit_items.year', 'like', '%'.$year.'%')						
						->where(function($query) use ($data){
							$query->orWhere('users.firstname', 'like', '%'.$data.'%');
							$query->orWhere('users.lastname', 'like',  '%'.$data.'%');
							$query->orWhere('users.identity_card', 'like',  '%'.$data.'%');
						})
						->orderBy('deposit_items.id', 'desc')
						->get(['deposit_items.*', 'deposits.client', 'deposit_types.description as deposit_type_description', 'users.firstname', 'users.lastname', 'users.contact_person', 'users.contact_person_phone', 'users.contact_person_cellphone']);
		return Response::json($depositTypes);
	}

	public function expenses()
	{
		$expenseTypeId = Input::get("expense_type_id");
		$data = Input::get("data");
		$month = Input::get("month");
		$year = Input::get("year");
		$paymentTypes = PaymentType::join('payment_items', 'payment_items.payment_type_id', '=', 'payment_types.id')
						->join('payments', 'payments.id', '=', 'payment_items.payment_id')
						->join('users', 'users.id', '=', 'payments.user_id')
						->where('payment_types.id', $expenseTypeId)
						->where('payment_items.month', 'like',  '%'.$month.'%')
						->where('payment_items.year', 'like', '%'.$year.'%')						
						->where(function($query) use ($data){
							$query->orWhere('payments.creditor', 'like', '%'.$data.'%');
							$query->orWhere('payments.creditor_ci', 'like',  '%'.$data.'%');
						})
						->orderBy('payment_items.id', 'desc')
						->get(['payment_items.*', 'payments.creditor', 'payments.creditor_ci', 'payment_types.description as payment_type_description', 'users.firstname', 'users.lastname', 'users.contact_person', 'users.contact_person_phone', 'users.contact_person_cellphone']);
		return Response::json($paymentTypes);
	}

	public function searchAttendances()
	{
		$user_id  = Input::get('user_id');
		$from  = Input::get('from');
		$to  = Input::get('to');
		$type = Input::get('type');
		$attendances = Attendance::join('users', 'users.id', '=', 'attendances.user_id')
								  ->where('users.id', $user_id)
								  ->where('attendances.record_type', $type)
								  ->whereBetween('attendances.record_date', array($from, $to))
								  ->orderBy('attendances.record_date', 'desc')
								  ->get(['attendances.*', 'users.firstname', 'users.lastname', 'users.identity_card']);

		return Response::json($attendances);
	}

	private function positiveBalanceLastMonth($month, $year)
	{
		if (intval($month) == 1) {
			$year = intval($year) - 1;
			$month = 12;
		}else{
			$month = intval($month) - 1;
		}
		$year = strval($year);
		$month = strval($month);

		if (strlen($month) == 1) {
			$month = "0".$month;
		};

		$income = Deposit::where('deposit_date','like', $year."-".$month."-%")
		              ->join('deposit_items', 'deposit_items.deposit_id', '=', 'deposits.id')
		              ->sum('deposit_items.amount');

		$expenditure = Payment::where('payment_date','like', $year."-".$month."-%")
		                ->join('payment_items', 'payment_items.payment_id', '=', 'payments.id')
		                ->sum('payment_items.amount');

		if ($this->positiveBalanceLastMonth($month, $year) != 0) {
			$positive_balance = $income - $expenditure + $this->positiveBalanceLastMonth($month, $year);
		}else{
			$positive_balance = $income - $expenditure;
			return $positive_balance;
		}
	}
	public function balance($month, $year)
	{
		if (strlen($month) == 1) {
			$monthStr = "0".$month;
		};

		$income = Deposit::where('deposit_date','like', $year."-".$monthStr."-%")
		              ->join('deposit_items', 'deposit_items.deposit_id', '=', 'deposits.id')
		              ->sum('deposit_items.amount');

		$expenditure = Payment::where('payment_date','like', $year."-".$monthStr."-%")
		                ->join('payment_items', 'payment_items.payment_id', '=', 'payments.id')
		                ->sum('payment_items.amount');

		$positive_balance_last_month = $this->positiveBalanceLastMonth($month, $year);

		$positive_balance = $positive_balance_last_month + $income - $expenditure;

		$data = array(
			'positive_balance_last_month' => $positive_balance_last_month,
			'income'=> $income,
			'total_income' => $positive_balance_last_month + $income,
			'expenditure'=> $expenditure,
			'positive_balance' => $positive_balance
		);
		return Response::json($data);
	}

	public function income($month, $year)
	{
		if (strlen($month) == 1) {
			$month = "0".$month;
		};
		$income = Deposit::with('student.user')
		                   ->with('depositItems.depositType')
		                   ->where('deposit_date','like', $year."-".$month."-%")
		                   ->get()->toArray();

		$sum = Deposit::where('deposit_date','like', $year."-".$month."-%")
		              ->join('deposit_items', 'deposit_items.deposit_id', '=', 'deposits.id')
		              ->sum('deposit_items.amount');

		$data =  array(
			'income' => $income,
			'sum' => $sum
		);              
		return Response::json($data);
	}

	public function expenditure($month, $year)
	{
		if (strlen($month) == 1) {
			$month = "0".$month;
		};
		$expenditure = Payment::with('user')
		                      ->with('paymentItems.paymentType')
		                      ->where('payment_date','like', $year."-".$month."-%")
		                      ->get()->toArray();

		$total = Payment::where('payment_date','like', $year."-".$month."-%")
		                ->join('payment_items', 'payment_items.payment_id', '=', 'payments.id')
		                ->sum('payment_items.amount');

		$data =  array(
			'expenditure' => $expenditure,
			'total' => $total
		);              
		return Response::json($data);
	}

	public function consultarIngreso() {
		$depositos = Deposit::where('balance_id', Input::get("balance_id"))
			->where('user_id', Input::get("user_id"))
			->orderBy('deposit_date', 'desc')
			->get();
		return Response::json($depositos);
	}

	/*recupera los items de egreso*/
	public function consultarEgreso() {
		$desde = Input::get('desde');
		$hasta = Input::get('hasta');
		$egresos = PaymentItem::where('payment_type_id', Input::get('payment_type_id'))
								->whereBetween('created_at', array($desde, $hasta))
								->orderBy('created_at', 'desc')
								->get();
		return Response::json($egresos);
	}

	public function detalleIngreso($balance_id) {
		$ingresos = Balance::find($balance_id)->deposits()->with('student.user')
							->orderBy('created_at', 'desc')
							->get()
							->toArray();
        $totalIngresos = Balance::find($balance_id)->deposits()->sum('amount');
		return Response::json([
			'ingresos' => $ingresos,
			'total_ingresos' => $totalIngresos
		]);
	}
	public function detalleEgreso($balance_id) {
		$egresos = Balance::find($balance_id)->payments()
							->orderBy('created_at', 'desc')
							->get()
							->toArray();
		$totalEgresos = Balance::find($balance_id)->payments()->sum('amount');
		return Response::json([
			'egresos' => $egresos,
			'total_egresos' => $totalEgresos
		]);
	}
	public function consultarSaldo($balance_id) {
		$saldoAnterior = Balance::find($balance_id)->amount;
		$totalIngresos = Balance::find($balance_id)->deposits()->sum('amount');
		$totalEgresos = Balance::find($balance_id)->payments()->sum('amount');
		$saldo = $saldoAnterior + $totalIngresos - $totalEgresos;
		return Response::json(['saldo' => $saldo]);
	}
}
?>
