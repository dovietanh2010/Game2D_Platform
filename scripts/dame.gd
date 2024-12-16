extends State

class_name Damage

@export var dead_node: String = "dead"  # Tên hoạt ảnh "dead" trong AnimationPlayer
@export var current_health: int = 100  # Máu hiện tại của nhân vật
@onready var progress_bar: ProgressBar = $"../ProgressBar"  # Thanh máu
@onready var animation: AnimationPlayer = $"../AnimationPlayer"  # AnimationPlayer cho hoạt ảnh
@onready var time: Timer = $Timer  # Bộ đếm thời gian

var is_dead: bool = false  # Theo dõi trạng thái chết của nhân vật

func _ready():
	print("Player sẵn sàng với " + str(current_health) + " máu")
	update_health_bar()
	# Đảm bảo Timer được kết nối với hàm `_on_Timer_timeout`
	time.connect("timeout", Callable(self, "_on_Timer_timeout"))

func hit(damage: int) -> void:
	if is_dead:
		return  # Không làm gì nếu nhân vật đã chết

	current_health -= damage
	current_health = max(current_health, 0)  # Đảm bảo máu không giảm dưới 0
	print("Nhận sát thương:", damage, " - Máu còn lại:", current_health)
	update_health_bar()

	if current_health <= 0:
		time_die()

func time_die():
	if is_dead:
		return  # Tránh xử lý nhiều lần trạng thái chết

	is_dead = true
	print("Nhân vật đã chết")
	
	# Kiểm tra AnimationPlayer và phát hoạt ảnh "dead"
	if animation and animation.has_animation(dead_node):
		print("Phát hoạt ảnh chết:", dead_node)
		
		# Đảm bảo AnimationPlayer đang hoạt động và không có hoạt ảnh nào khác cản trở
		animation.playback_active = true
		if animation.is_playing():
			print("Dừng hoạt ảnh cũ trước khi phát.")
			animation.stop()
		animation.play(dead_node)
		print("Hoạt ảnh 'dead' đang phát")
	else:
		print("Lỗi: Không tìm thấy hoạt ảnh 'dead' trong AnimationPlayer")

	# Bắt đầu đếm ngược Timer
	if time:
		time.wait_time = 1.0  # Thời gian chờ trước khi chuyển cảnh (có thể thay đổi)
		time.start()
	else:
		print("Lỗi: Timer không được tham chiếu!")


func _on_Timer_timeout():
	print("Kết thúc hoạt ảnh chết. Xử lý tiếp theo tại đây.")
	Collection.value(0)
	Point.value(0)
	Speed.value(0)
	Add.value(0)
	Health.value(0)
	
	# Ví dụ: Thay đổi cảnh sau khi nhân vật chết
	get_tree().change_scene_to_file("res://d.tscn")
	

func update_health_bar():
	if progress_bar:
		progress_bar.value = current_health
	else:
		print("Lỗi: ProgressBar không được tham chiếu!")

func up_health(health : int):
	progress_bar.value += health
