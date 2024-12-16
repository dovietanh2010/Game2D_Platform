extends Button


@export var action : String
@onready var control = $".."

func _init():
	toggle_mode = true
	
func _ready():
	set_process_unhandled_input(false)
	
func _toggled(toggled_on):
	set_process_unhandled_input(toggled_on)
	if toggled_on:
		text = "Press any key...."

func _unhandled_input(event):
	if event.pressed:
		InputMap.action_erase_events(action)
		InputMap.action_add_event(action, event)
		button_pressed = false
		release_focus()
		update_text()
		control.keymaps[action] = event
		control.save_keymap()
		
func update_text():
	text = InputMap.action_get_events(action)[0].as_text()
		
