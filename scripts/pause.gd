extends Control

@onready var pause_game: Control = $"." # Tham chiếu đến Control trong cây scene
var is_paused = false 
func _ready() -> void:
	pause_game.hide()
	Engine.time_scale = 1 # Ẩn giao diện tạm dừng khi bắt đầu game

# Tạm dừng game (logic của game)
func pause() -> void:
	pause_game.show()
	Engine.time_scale = 0
	  # Hiển thị giao diện tạm dừng
	# Tạm dừng logic nhân vật và kẻ địch bằng biến cờ

func resume() -> void:
	pause_game.hide()  # Ẩn giao diện tạm dừng
	Engine.time_scale = 1
	# Kích hoạt lại logic nhân vật và kẻ địch bằng cách tắt biến cờ

# Hàm khi Button 2 được nhấn, tiếp tục game
func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	

# Hàm khi Button được nhấn, chuyển cảnh đến màn hình Options
func _on_button_pressed() -> void:
	resume()
	

func _on_pause_menu_pressed() -> void:
	is_paused = not is_paused  # Đảo trạng thái tạm dừng
	if is_paused:
		pause()  # Tạm dừng game
	else:
		resume()  # Tiếp tục game

	pass # Replace with function body.
