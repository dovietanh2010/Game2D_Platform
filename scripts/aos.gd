extends Area2D


func _on_area_entered(area: Area2D) -> void:
	print(body)
	if body.name == "Player":
		print(body.name)
	pass # Replace with function body.
