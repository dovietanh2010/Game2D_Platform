extends Area2D


@export var damage : int = 10

func _ready() -> void:
	monitoring = false
	Add.on_dame_recived.connect(on_dame_recived)

func on_dame_recived(total_dame: int):
	damage += total_dame
	
func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	for child in body.get_children():
		if child is Dame:
			child.hit(damage)
			print_debug(body.name + " took " + str(damage)+ ".")
		if child is Dame_of_bee:
			child.hit(damage)
			print_debug(body.name + " took " + str(damage)+ ".")
