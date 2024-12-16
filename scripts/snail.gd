extends CharacterBody2D

# Constants for horizontal movement speed
const SPEED = 30.0  # Tốc độ di chuyển ngang
const PATROL_LIMIT = 100.0  # Khoảng cách di chuyển qua lại trong chế độ tuần tra

# Variables and node references
@onready var anim = $Container/AnimatedSprite2D
@onready var container = $Container
@onready var player = $"../Player"
@export var damage : int = 10
var patrol_direction = -1  # Bắt đầu di chuyển sang trái (-1 là trái, 1 là phải)
var start_position: Vector2  # Vị trí ban đầu của nhân vật

# Initialization
func _ready() -> void:
	start_position = position  # Lưu lại vị trí ban đầu của nhân vật
	anim.play("walk")  # Phát hoạt ảnh "walk"
	container.scale.x = 1  # Đảm bảo sprite quay mặt sang trái khi bắt đầu
	
# Physics process: quản lý di chuyển tuần tra
func _physics_process(delta: float) -> void:
	if not is_on_floor():
			velocity += get_gravity() * delta
	if anim.animation != "dead":
		# Di chuyển qua lại trong phạm vi tuần tra
		velocity.x = patrol_direction * SPEED

		# Nếu nhân vật vượt quá giới hạn tuần tra, đổi hướng
		if position.x > start_position.x + PATROL_LIMIT:
			patrol_direction = -1  # Đổi hướng sang trái
			container.scale.x = 1  # Lật sprite sang trái
		elif position.x < start_position.x - PATROL_LIMIT:
			patrol_direction = 1  # Đổi hướng sang phải
			container.scale.x = -1  # Lật sprite sang phải
	else:
		velocity = Vector2.ZERO
	# Áp dụng di chuyển
	move_and_slide()


func _on_aos_area_entered(body: Node2D) -> void:
	print(body.name)
	if body == player:
		print("Va chạm với:", body.name)
		for child in player.get_children():
			if child is Damage:
				child.hit(10)

	
func _on_body_entered(body: Node2D) -> void:
	for child in body.get_children():
		if child is Dame:
			child.hit(damage)
			print_debug(body.name + " took " + str(damage)+ ".")
