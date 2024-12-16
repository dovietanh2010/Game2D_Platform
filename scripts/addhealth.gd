extends Node

static var total_award_amount : int

signal on_health_recived

func give_pickup_award(collectioble_award: int):
	total_award_amount+= collectioble_award
	
	on_health_recived.emit(total_award_amount)

func value(value: int):
	on_health_recived.emit(value)
