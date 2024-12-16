extends Node

static var total_speed : int

signal on_speed_recived

func give_pickup_award(collectioble_award: int):
	total_speed+= collectioble_award
	
	on_speed_recived.emit(total_speed)
	
func value(value: int):
	on_speed_recived.emit(value)
