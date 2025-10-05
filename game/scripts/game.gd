extends Node2D

var arrow = preload("res://assets/Kursor.png")
var click = preload("res://assets/Kursor_-_Klik.png")
var hammer_cursor = preload("res://assets/Mlotek.png")
@onready var hammer_object: Node2D = $Door/Hammer
@onready var cursor_sprite: Sprite2D = $CursorSprite

@onready var hammer_state = hammer_object.hammer_picked

@onready var mouse_image = arrow

var click_pressed = false
var spring_back = false
var num_of_bonks = 0

func _input(event) :
	if event is InputEventMouseButton :
		if event.button_index == MOUSE_BUTTON_LEFT :
			if event.pressed :
				click_pressed = true
				if not hammer_state :
					cursor_sprite.texture = click
			else :
				click_pressed = false
				spring_back = true
				if not hammer_state :
					cursor_sprite.texture = arrow
				else :
					cursor_sprite.texture = hammer_cursor

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

var rotation_speed = 0.1
var max_angle = PI/4

func _process(delta: float) -> void:
	hammer_state = hammer_object.hammer_picked
	cursor_sprite.position = get_global_mouse_position()
	
	if hammer_state and click_pressed :
		cursor_sprite.rotation += rotation_speed
		cursor_sprite.rotation = min(cursor_sprite.rotation, max_angle)
	if hammer_state and spring_back :
		cursor_sprite.rotation -= 3*rotation_speed
		if cursor_sprite.rotation <= 0 :
			cursor_sprite.rotation = 0
			spring_back = false
			#$CursorSprite/Bonk.play()
