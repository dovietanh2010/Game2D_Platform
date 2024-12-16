extends Area2D
@onready var anim = $AnimatedSprite2D
func _ready() -> void:
	anim.play("big_health")
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		queue_free()
		for child in body.get_children():
				if child is Damage:
					child.up_health(50)
