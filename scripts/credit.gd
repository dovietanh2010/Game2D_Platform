extends Node

static var total_pay : int

signal on_credit

func give_pickup_award(collectioble_award: int):
	total_pay += collectioble_award
	on_credit.emit(total_pay)

func pay(payment: int):
	total_pay -= payment
	on_credit.emit(total_pay)
