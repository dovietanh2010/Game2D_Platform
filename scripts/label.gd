extends Label

@onready var collection_label = $"."

func _ready():
	Collection.on_collectible_recived.connect(on_collectible_recived)

func on_collectible_recived(total_award : int):
	collection_label.text = str(total_award)
