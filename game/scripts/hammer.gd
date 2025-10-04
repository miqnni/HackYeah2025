extends Node2D

@onready var texture_button: TextureButton = $TextureButton
@onready var bar_dot: Sprite2D = $"../colorbar/bar_dot"

var hammer_picked = false

var hammer_val = 0
var hammer_threshold = 145
var hammer_jump = 2
var hammer_good_threshold = 30

@onready var dot_x_center = bar_dot.position.x

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		print("Wow, a left mouse click")
	

func _process(delta: float) :
	if hammer_picked :
		texture_button.disabled = true
		if (hammer_val <= -hammer_threshold and hammer_jump < 0) or (hammer_val >= hammer_threshold and hammer_jump > 0) :
			hammer_jump *= -1.01
		hammer_val += hammer_jump
		hammer_val = min(max(hammer_val, -hammer_threshold), hammer_threshold)
	else :
		hammer_val = 0
		texture_button.disabled = false
	bar_dot.position.x = dot_x_center + hammer_val
	
func _on_texture_button_button_down() :
	hammer_picked = true
