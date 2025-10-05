extends Node2D

@onready var rigid_body_2d: RigidBody2D = $RigidBody2D
@onready var collision_shape_2d: CollisionShape2D = $RigidBody2D/CollisionShape2D
@onready var hammer: Node2D = $"../../../Hammer"
@onready var button: TextureButton =  $RigidBody2D/TextureButton
@onready var sprite_2d: Sprite2D = $RigidBody2D/Sprite2D
@onready var bolt_loose: RigidBody2D = $RigidBody2D2
@onready var GAME: Node2D = $"../../../.."


var bolt_out = 0
var bolt_threshold = 0.5
var bolt_released = false

var vel_max = 200
var ang_max = 5*PI

var bolt_loose_base = 0

var bolt_prob = 0.01
var bolt_jump = 0.001
var rng = RandomNumberGenerator.new()

func _process(delta: float) :
	if bolt_released or not GAME.RUNNING :
		return
	var rand = rng.randf_range(0, 1)
	if rand < bolt_prob :
		bolt_out += bolt_jump
		#if bolt_jump <= 0.2 :
			#bolt_jump += 0.001
	
	sprite_2d.modulate = Color(1, 0, 0, bolt_out)
	
	if bolt_out >= 1 :
		release_bolt()
	
func _ready() :
	GAME.bolts_left += 1
	rigid_body_2d.freeze = true
	bolt_loose_base = bolt_loose.position
	bolt_loose.freeze = true

func release_bolt() :
	rigid_body_2d.freeze = false
	rigid_body_2d.visible = false
	bolt_released = true
	bolt_loose.visible = true
	bolt_loose.freeze = false
	bolt_loose.angular_velocity = rng.randf_range(-ang_max, ang_max)
	bolt_loose.linear_velocity.x = rng.randf_range(-vel_max, vel_max)
	bolt_loose.linear_velocity.y = rng.randf_range(-2*vel_max, 0)
	GAME.bolts_left -= 1
	

func _on_texture_button_button_down() -> void:
	if hammer.hammer_picked :
		if abs(hammer.hammer_val) < hammer.hammer_good_threshold :
			bolt_out = 0
		else :
			if bolt_out > bolt_threshold :
				bolt_out = 1
			else :
				bolt_out = 0
		GAME.play_sound($Wood_Bonk, 1.25 * GAME.sfx)
		return
	
	bolt_out = 1
