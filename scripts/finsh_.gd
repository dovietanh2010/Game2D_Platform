extends Node2D

@onready var label = $Label2
@export var p : int

func _ready():
	# Kết nối tín hiệu on_point_recived để nhận giá trị
	Point.on_point_recived.connect(on_point)
	print("da")
	change_point()
	
func on_point(point: int):
	# Cập nhật giá trị p khi nhận được tín hiệu
	p = point
  # Gọi change_point() để cập nhật label khi p thay đổi

func change_point():
	# Cập nhật nội dung label với giá trị p
	p = Point.point_finish()
	label.text = "Point: " + str(p)
	print(p)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	pass # Replace with function body

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://game2.tscn")
	pass # Replace with function body


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://game2.tscn")
	Collection.value(0)
	Point.value(0)
	pass # Replace with function body.
