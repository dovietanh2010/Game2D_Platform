extends Label

@onready var point_label = $"."

func _ready():
	Point.on_point_recived.connect(on_point_recived)

func on_point_recived(total_award : int):
	point_label.text = str("Point: ",total_award)
