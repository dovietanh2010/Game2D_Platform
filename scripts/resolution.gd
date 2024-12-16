extends Control

@onready var option_button = $OptionButton as OptionButton

const RESOLUTION_DICTIONARY : Dictionary = {
	"1152 x 648" : Vector2i(1152,648),
	"1280 x 728" : Vector2i(1280,720),
	"1920 x 1000" : Vector2i(1920,1000)	
}

func _ready():
	option_button.item_selected.connect(on_resolution_selected)
	add_resolution_item()
	
func add_resolution_item() -> void:
	for resolution_size_text in RESOLUTION_DICTIONARY:
		option_button.add_item(resolution_size_text)
	
	
func on_resolution_selected(index: int) -> void:
	DisplayServer.window_set_size(RESOLUTION_DICTIONARY.values()[index])
	
