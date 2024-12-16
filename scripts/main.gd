extends Node2D



func _on_bquit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_bplay_pressed() -> void:
	get_tree().change_scene_to_file("res://level.tscn")
	pass # Replace with function body.


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Option.tscn")
	pass # Replace with function body.
