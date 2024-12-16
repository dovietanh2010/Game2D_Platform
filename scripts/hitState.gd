extends State

class_name HitState

@export var damageable : Dame
@export var dead_state : Stat

func _ready() -> void:
	damageable.connect("on_hit", on_damageable_hit)
	
func on_damageable_hit(node :Node, damage_amount : int):
	if(damageable.health > 0):
		exit_signal("interupt_state",  self)
	else:
		exit_signal("interupt_state",  dead_state)
	
