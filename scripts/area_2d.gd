

extends Area2D
@onready var timer = $Timer


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://d.tscn")# Replace with function body.

func _on_area_entered(boby) -> void:
	print("You died!")
	Collection.value(0)
	Point.value(0)
	Speed.value(0)
	Add.value(0)
	Health.value(0)
	timer.start()
	
	pass # Replace with function body.
