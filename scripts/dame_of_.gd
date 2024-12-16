extends Node  # Hoặc kế thừa từ `Area2D` tùy vào thiết kế của bạn

class_name Dame_of_bee
@export var  health = 30
@export var  point = 30
@onready var progress_bar: ProgressBar = $"../ProgressBar"
@onready var area = $"../Area2D"

var current_health: int = health
var is_dead: bool = false

func _ready():
	print("Enemy sẵn sàng với " + str(health) + " máu")
	update_health_bar()

func hit(damage: int) -> void:
	current_health -= damage
	print("damage")
	current_health = max(current_health, 0)  # Đảm bảo máu không dưới 0
	update_health_bar()
	if current_health <= 0:
		die()
		
		

func update_health_bar():
	progress_bar.value = current_health

func die():
	print("Enemy bị tiêu diệt")
	Point.give_pickup_award(point)
	area.set_monitoring(true)
	get_parent().queue_free()  # Xóa đối tượng Enemy khỏi game khi hết máu
