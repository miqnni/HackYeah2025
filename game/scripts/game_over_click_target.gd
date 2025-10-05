extends Area2D

@onready var game_over_sprite: Sprite2D = $".."


func _input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("left_click"):
		print("Game over screen clicked!")
		game_over_sprite.next_slide()
