extends Node  # Hoặc kế thừa từ `Area2D` tùy vào thiết kế của bạn

class_name Dame
@export var  health = 20
@export var  point = 20
@onready var progress_bar: ProgressBar = $"../ProgressBar"
var current_health: int = health
@onready var anim = $"../Container/AnimatedSprite2D"
@onready var time = $"../Container/AnimatedSprite2D/Timer"
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
	anim.play('dead')
	time.start()
	if not time.is_connected("timeout", Callable(self, "_on_Timer_timeout")):
		time.connect("timeout", Callable(self, "_on_Timer_timeout"))




func _on_Timer_timeout():
	# Xóa đối tượng cha (hoặc chính đối tượng này nếu cần)
	print("Timer kết thúc, nhân vật bị xóa.")
	Point.give_pickup_award(point)
	get_parent().queue_free()  # Xóa đối tượng Enemy khỏi game khi hết máu
