extends Path2D

# Called when the node enters the scene tree for the first time.
func _ready():
	# No need to resize qt every frame as mobile device don't change their size ;)
	position = get_parent().get_parent_area_size() / 2
