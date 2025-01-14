extends Control

@export var BonusText: PackedScene

var display_bonus_text_position: Vector2

func _ready():
	# get position for bonus text
	$ScoreText.text = str(Constants.score)
	
	
	var computed_safe_area: Rect2 = $MarginContainer.computed_safe_area
	$ScoreText.position = Vector2(
		computed_safe_area.position.x + computed_safe_area.size.x * .5,
		computed_safe_area.position.y + 96,
	)
	$Hearts.position = Vector2(
		computed_safe_area.position.x + computed_safe_area.size.x * .5,
		computed_safe_area.position.y + 2.5 * 96,
	)
	display_bonus_text_position = Vector2(
		computed_safe_area.position.x + computed_safe_area.size.x * .5,
		computed_safe_area.position.y + computed_safe_area.size.y * .8,
	)
func lose_heart():
	$Hearts.lose_heart()
	
func _on_pause_button_pressed():
	Session.click()
	Constants.pause = true
	Session.pause_with_opacity()
	
func update_score(score):
	$ScoreText.text = str(score)
	$ScoreText.pulse()

func display_bonus_text(text):
	# TODO: text display on top of each other sometime, rethink the position and/or the animation
	var bonus_text = BonusText.instantiate()
	bonus_text.text = text
	bonus_text.position = display_bonus_text_position + Vector2(randf_range(-64, 64), randf_range(-64, 64)) # randomise
	add_child(bonus_text)
