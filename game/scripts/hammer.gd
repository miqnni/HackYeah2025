extends Node2D

@onready var texture_button: TextureButton = $TextureButton
@onready var bar_dot: Sprite2D = $"../colorbar/bar_dot"

var hammer_picked = false

var hammer_val = 0
var hammer_threshold = 290
var hammer_jump = 2
var hammer_good_threshold = 60

var no_hammer_normal = preload("res://assets/Paseczek.png")
var no_hammer_hover = preload("res://assets/Paseczek_Hover.png")
var hammer_normal = preload("res://assets/Młotek__BEz_Obwódki_.png")
var hammer_hover = preload("res://assets/Młotek_Z_Obwódką_.png")

@onready var dot_x_center = bar_dot.position.x
@onready var GAME: Node2D = $"../.."


func _process(delta: float) :
	if not GAME.RUNNING :
		return
	if hammer_picked :
		texture_button.texture_normal = no_hammer_normal
		texture_button.texture_hover = no_hammer_hover
		if (hammer_val <= -hammer_threshold and hammer_jump < 0) or (hammer_val >= hammer_threshold and hammer_jump > 0) :
			hammer_jump *= -1.01
		hammer_val += hammer_jump
		hammer_val = min(max(hammer_val, -hammer_threshold), hammer_threshold)
	else :
		hammer_val = 0
		texture_button.texture_normal = hammer_normal
		texture_button.texture_hover = hammer_hover
	bar_dot.position.x = dot_x_center + hammer_val
	
func _on_texture_button_button_down() :
	hammer_picked = !hammer_picked
	print(hammer_picked)
