extends Node2D

@onready var texture_button: TextureButton = $TextureButton

var hammer_picked = false

var hammer_val = 0
var hammer_max = 100
var hammer_min = -100
var hammer_jump = 1

func _process(delta: float) :
	if hammer_picked :
		texture_button.disabled = true
		if (hammer_val <= hammer_min and hammer_jump < 0) or (hammer_val >= hammer_max and hammer_jump > 0) :
			hammer_jump *= -1.1
		hammer_val += hammer_jump
		hammer_val = min(max(hammer_val, hammer_min), hammer_max)
	print(hammer_val)
	
func _on_texture_button_button_down() :
	hammer_picked = true
