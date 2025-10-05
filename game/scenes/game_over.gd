extends Sprite2D

# Witch Ending (E0) Textures
var tex_w1 = preload("res://Wiedźma end/Endwiedzma1.png")
var tex_w2 = preload("res://Wiedźma end/Endwiedzma2.png")
var tex_w3 = preload("res://Wiedźma end/Endwiedzma3.png")
var tex_w4 = preload("res://Wiedźma end/Endwiedzma4.png")
var tex_w5 = preload("res://Wiedźma end/Endwiedzma5.png")
var tex_w6 = preload("res://Wiedźma end/Endwiedzma6.png")

# Clients Ending (E1) Textures
var tex_c1 = preload("res://assets/Potwory end/Endpotwor1.png")
var tex_c2 = preload("res://assets/Potwory end/Endpotwor2.png")
var tex_c3 = preload("res://assets/Potwory end/Endpotwor3.png")
var tex_c4 = preload("res://assets/Potwory end/Endpotwor4.png")
var tex_c5 = preload("res://assets/Potwory end/Endpotwor5.png")
var tex_c6 = preload("res://assets/Potwory end/Endpotwor6.png")
var tex_c7 = preload("res://assets/Potwory end/Endpotwor7.png")
var tex_c8 = preload("res://assets/Potwory end/Endpotwor8.png")
var credits = preload("res://assets/Credits.png")

# Arrays of ending textures
@onready var ending_w_tex: Array[Resource] = [tex_w1, tex_w2, tex_w3, tex_w4, tex_w5, tex_w6, credits]
@onready var ending_c_tex: Array[Resource] = [tex_c1, tex_c2, tex_c3, tex_c4, tex_c5, tex_c6, tex_c7, tex_c8, credits]

#@onready var selected_ending_tex: Array[Resource] = []
@onready var selected_ending_tex: Array[Resource] = ending_w_tex # Debug default val
@onready var curr_slide_idx: int = 0
@onready var game = $".."

const auto_change_slide_time = 3

func _ready() -> void:
	# Disable the node
	hide()
	pass

func next_slide() -> void:
	$ChangeSlideTimer.stop()
	var n = selected_ending_tex.size()
	curr_slide_idx += 1
	
	if curr_slide_idx >= n:
		hide()
		# TODO: return to main menu
		return
	
	var curr_slide_tex = selected_ending_tex[curr_slide_idx]
	texture = curr_slide_tex
	$ChangeSlideTimer.start(5)

# Call after writing to `selected_ending_tex`
func common_ending_function() -> void:
	$ChangeSlideTimer.start(auto_change_slide_time)
	#var n = selected_ending_tex.size()
	
	# Load the first texture
	if selected_ending_tex.size() > 0:
		texture = selected_ending_tex[0]
		# Enable the GameOver node to be displayed and clicked
		show()
	
	# Now... do nothing. The subsequent textures will be loaded
	# via the `next_slide()` function called on clicking
	# the node: GameOver/Area2D



func witch_ending() -> void: # Type 0 Ending
	selected_ending_tex = ending_w_tex
	common_ending_function()
	
func clients_ending() -> void: # Type 1 Ending
	selected_ending_tex = ending_c_tex
	common_ending_function()
	
	
func _on_change_slide_timer_timeout() -> void:
	next_slide()
	$ChangeSlideTimer.start(auto_change_slide_time)
