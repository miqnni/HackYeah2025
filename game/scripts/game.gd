extends Node2D

var arrow = preload("res://assets/Kursor.png")
var click = preload("res://assets/Kursor_-_Klik.png")
var hammer_cursor = preload("res://assets/Mlotek.png")
@onready var hammer_object: Node2D = $Door/Hammer
@onready var cursor_sprite: Sprite2D = $CursorSprite

@onready var hammer_state = hammer_object.hammer_picked

@onready var mouse_image = arrow

var bolts_left = 0 

var click_pressed = false
var spring_back = false
var num_of_bonks = 0

var vol_min = -50
var vol_max = 24

var music = 30

var sfx = 50

var rotation_speed = 0.1
var max_angle = PI/4

var final_counter = 0
var final_counter_max = 200

var RUNNING = true

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
	play_sound($Background_Music, music)

func play_sound(audioplay, volume) :
	audioplay.volume_db = vol_min + (volume * abs(vol_min - vol_max)) / 100
	audioplay.play()

func game_over(type = 0) :
	RUNNING = false
	print("Game over")

func _process(delta: float) -> void:
	if not $Background_Music.playing :
		play_sound($Background_Music, music)
	if not RUNNING :
		return
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
			
	if bolts_left == 0 :
		final_counter += 1
		if final_counter >= final_counter_max :
			# cause game over
			game_over()
			pass
