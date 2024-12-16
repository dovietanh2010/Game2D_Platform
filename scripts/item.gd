extends Area2D

@onready var anim = $AnimatedSprite2D
@export var point : int = 10
@onready var label = $Label

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		anim.hide()
		label.text = "%s" % point
		Collection.give_pickup_award(point)
		label.show()
	pass # Replace with function body.
	var tween = get_tree().create_tween()
	tween.tween_property(label,"position", Vector2(label.position.x, label.position.y + -10),0.5).from_current()
	tween.tween_callback(queue_free)
