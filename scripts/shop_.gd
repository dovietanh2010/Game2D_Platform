extends Control


@onready var shop:  = $Shop
var is_paused = false 
func _ready() -> void:
	shop.hide()
	Engine.time_scale = 1 # Ẩn giao diện tạm dừng khi bắt đầu game
	
func pause() -> void:
	shop.show()
	Engine.time_scale = 0
	  # Hiển thị giao diện tạm dừng
	# Tạm dừng logic nhân vật và kẻ địch bằng biến cờ

func resume() -> void:
	shop.hide()  # Ẩn giao diện tạm dừng
	Engine.time_scale = 1


func _on_shop_btn_pressed() -> void:
	pause()
	pass # Replace with function body.
