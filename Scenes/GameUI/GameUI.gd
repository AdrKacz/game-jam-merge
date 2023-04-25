extends Control

@export var BonusText: PackedScene

var display_bonus_text_position: Vector2

func _ready():
	# get position for bonus text
	var area_size: Vector2 = $MarginContainer.get_parent_area_size()
	display_bonus_text_position = Vector2(
		area_size.x * .5,
		area_size.y * .8
	)
	$MarginContainer/ScoreMarginContainer/Label.text = str(Constants.score)

func _on_pause_button_pressed():
	SoundManager.play_click()
	Constants.pause = true
	Session.pause_with_opacity()
	
func update_score(score):
	$MarginContainer/ScoreMarginContainer/Label.text = str(score)
	
func display_bonus_text(text):
	# TODO: text display on top of each other sometime, rethink the position and/or the animation
	var bonus_text = BonusText.instantiate()
	bonus_text.text = text
	bonus_text.position = display_bonus_text_position + Vector2(randf_range(-64, 64), randf_range(-64, 64)) # randomise
	add_child(bonus_text)
