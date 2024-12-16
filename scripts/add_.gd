extends Node

static var total_dame : int

signal on_dame_recived

func give_pickup_award(collectioble_award: int):
	total_dame+= collectioble_award
	
	on_dame_recived.emit(total_dame)
	
func value(value: int):
	on_dame_recived.emit(value)
