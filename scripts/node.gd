extends Node  # Hoặc kế thừa từ `Area2D` tùy vào thiết kế của bạn

class_name Damage_P
@export var attack_node : String = "dead"
@export var  health = 100
@onready var progress_bar: ProgressBar = $"../ProgressBar"
var current_health: int = health


func _ready():
	print("Player sẵn sàng với " + str(health) + " máu")
	update_health_bar()

func hit(damage: int) -> void:
	current_health -= damage
	print("damage")
	current_health = max(current_health, 0)  # Đảm bảo máu không dưới 0
	update_health_bar()
	if current_health <= 0:
		die()
		
		
func up_health(up: int) -> void:
	current_health += up
	current_health = max(current_health, 0)
	update_health_bar()
	

func update_health_bar():
	progress_bar.value = current_health

func die():
	print("Nhân vật đã chết")
	playback.travel(attack_node)
	get_tree().change_scene_to_file("res://die.tscn")
