extends Node2D


@onready var dot: TextureButton = $dot
@onready var h_slider: HSlider = $HSlider

@onready var dot_base = dot.position

var dot_max_x = 200

var clicked = false

var mouse_bias = 0

var slider_val = 0

func _process(delta: float) :
	
	if clicked :
		dot.position.x = get_global_mouse_position().x - dot_base.x - mouse_bias
		if dot.position.x < dot_base.x :
			dot.position.x = dot_base.x
		if dot.position.x > dot_base.x + dot_max_x :
			dot.position.x = dot_base.x + dot_max_x
			
	slider_val = 100 * (dot.position.x - dot_base.x) / dot_max_x 
	print(slider_val)


func _on_dot_button_down() -> void:
	clicked = true
	pass # Replace with function body.


func _on_dot_button_up() -> void:
	clicked = false
	pass # Replace with function body.
