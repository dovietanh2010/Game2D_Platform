extends Node2D

# Tham chiếu đến giao diện
@onready var collection_label = $Label2
@onready var shop: Node = $"."  # Tham chiếu đến shop

# Các biến được xuất để tùy chỉnh trong Godot Editor
@export var price: int = 10
@export var speed: int = 10.0
@export var dame: int = 10
@export var health: int  = 10.0

# Biến lưu tổng số phần thưởng, tốc độ, và sức mạnh
var total_award: int = 0
var total_speed: int = 0
var total_dame: int = 0
var total_health: int = 0

# Trạng thái để tránh vòng lặp tín hiệu
var is_updating_award: bool = false
var is_updating_speed: bool = false
var is_updating_dame: bool = false
var is_updating_health: bool = false

func _ready() -> void:
	# Kết nối tín hiệu
	Collection.on_collectible_recived.connect(on_collectible_recived)
	Speed.on_speed_recived.connect(on_speed_recived)
	Health.on_health_recived.connect(on_health_recived)

# Xử lý khi nhận phần thưởng
func on_collectible_recived(new_award: int) -> void:
	if not is_updating_award:
		total_award = new_award
		collection_label.text = str(total_award)
		print("Updated total_award to:", total_award)

# Xử lý khi nhận tốc độ mới
func on_speed_recived(new_speed: int) -> void:
	if not is_updating_speed:
		total_speed = new_speed
		print("Updated total_speed to:", total_speed)

func on_health_recived(new_health: int) -> void:
	if not is_updating_health:
		total_health = new_health
		print("Updated total_health to:", total_health)
# Xử lý khi nhấn nút nâng cấp tốc độ
func _on_button_pressed() -> void:
	if total_award >= price:
		# Trừ phần thưởng
		total_award -= price

		# Cập nhật tốc độ
		add_speed(speed)

		# Phát tín hiệu để cập nhật phần thưởng
		is_updating_award = true
		Collection.give_pickup_award(-price)
		is_updating_award = false

		# Cập nhật giao diện
		collection_label.text = str(total_award)
		print("Speed upgraded! Total award left:", total_award)
	else:
		print("Not enough awards to upgrade speed!")
		print("Current awards:", total_award)

# Thêm tốc độ
func add_speed(speed_to_add: int) -> void:
	total_speed += speed_to_add

	# Phát tín hiệu để cập nhật tốc độ
	is_updating_speed = true
	if Speed and Speed.has_method("give_pickup_award"):
		Speed.give_pickup_award(total_speed)
	is_updating_speed = false

	print("New speed:", total_speed)

# Xử lý khi nhấn nút nâng cấp sức mạnh
func _on_button_2_pressed() -> void:
	if total_award >= price:
		# Trừ phần thưởng
		total_award -= price

		# Cập nhật sức mạnh
		add_dame(dame)

		# Phát tín hiệu để cập nhật phần thưởng
		is_updating_award = true
		Collection.give_pickup_award(-price)
		is_updating_award = false

		# Cập nhật giao diện
		collection_label.text = str(total_award)
		print("Damage upgraded! Total award left:", total_award)
	else:
		print("Not enough awards to upgrade damage!")
		print("Current awards:", total_award)

# Thêm sức mạnh
func add_dame(dame_to_add: int) -> void:
	total_dame += dame_to_add

	# Phát tín hiệu để cập nhật sức mạnh
	is_updating_dame = true
	if Add and Add.has_method("give_pickup_award"):
		Add.give_pickup_award(total_dame)
	is_updating_dame = false

	print("New damage:", total_dame)

# Xử lý khi nhấn nút thoát shop
func _on_button__pressed() -> void:
	shop.hide()  # Ẩn giao diện tạm dừng
	Engine.time_scale = 1


func _on_button_3_pressed() -> void:
	if total_award >= price:
		# Trừ phần thưởng
		total_award -= price

		# Cập nhật sức mạnh
		add_health(health)

		# Phát tín hiệu để cập nhật phần thưởng
		is_updating_award = true
		Collection.give_pickup_award(-price)
		is_updating_award = false

		# Cập nhật giao diện
		collection_label.text = str(total_award)
		print("Damage upgraded! Total award left:", total_award)
	else:
		print("Not enough awards to upgrade damage!")
		print("Current awards:", total_award)

	pass # Replace with function body.

func add_health(health_to_add: int):
	total_health += health_to_add

	# Phát tín hiệu để cập nhật sức mạnh
	is_updating_health = true
	if Health and Health.has_method("give_pickup_award"):
		Health.give_pickup_award(total_health)
	is_updating_health = false

	print("New health:", total_health)
