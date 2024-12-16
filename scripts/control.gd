extends TabBar

const keymaps_path = "user://keymaps.dat"
var keymaps: Dictionary = {}  # Khởi tạo dictionary trống

func _ready():
	# Khởi tạo keymaps từ InputMap
	for action in InputMap.get_actions():
		if InputMap.action_get_events(action).size() != 0:
			keymaps[action] = InputMap.action_get_events(action)[0]
	
	# Load keymap từ file
	load_keymap()

	# Cập nhật text cho tất cả các children có method update_text
	for n in get_children():
		if n.has_method("update_text"):
			n.update_text()
	
func load_keymap():
	# Kiểm tra file tồn tại
	if not FileAccess.file_exists(keymaps_path):
		save_keymap()  # Nếu không tồn tại, tạo file mới
		return
	
	# Mở file để đọc
	var file = FileAccess.open(keymaps_path, FileAccess.READ)
	if not file:
		print("Lỗi: Không thể mở file keymaps!")
		return
	
	# Đọc keymaps từ file
	var temp_keymap = file.get_var(true) as Dictionary
	file.close()
	
	# Cập nhật keymaps vào InputMap
	for action in keymaps.keys():
		if temp_keymap.has(action):
			keymaps[action] = temp_keymap[action]
			InputMap.action_erase_events(action)  # Xóa sự kiện cũ
			InputMap.action_add_event(action, keymaps[action])  # Thêm sự kiện mới
			
func save_keymap():
	# Mở file để ghi
	var file = FileAccess.open(keymaps_path, FileAccess.WRITE)
	if not file:
		print("Lỗi: Không thể lưu file keymaps!")
		return
	
	# Ghi keymaps vào file
	file.store_var(keymaps, true)
	file.close()
