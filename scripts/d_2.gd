extends Node2D




func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game2.tscn")
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	pass # Replace with function body.
