extends Node

static var total_award_amount : int

signal on_point_recived

func give_pickup_award(collectioble_award: int):
	total_award_amount+= collectioble_award
	
	on_point_recived.emit(total_award_amount)

func value(value: int):
	on_point_recived.emit(value)
	total_award_amount = 0

func point_finish():
	return total_award_amount
