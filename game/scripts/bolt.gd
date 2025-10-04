extends Node2D

#@onready var button: Button = $Button
@onready var rigid_body_2d: RigidBody2D = $RigidBody2D
@onready var collision_shape_2d: CollisionShape2D = $RigidBody2D/CollisionShape2D
@onready var hammer: Node2D = $"../../../Hammer"
@onready var button: TextureButton =  $RigidBody2D/TextureButton

var bolt_out = 0
var bolt_threshold = 0.5
var bolt_released = false

var bolt_prob = 0.01
var rng = RandomNumberGenerator.new()

func _process(delta: float) :
	if bolt_released :
		return
	var rand = rng.randf_range(0, 1)
	if rand < bolt_prob :
		bolt_out += 0.01
	
	button.modulate = Color(1, 0, 0, bolt_out)
	
	if bolt_out >= 1 :
		release_bolt()
	
func _ready() :
	rigid_body_2d.freeze = true

func release_bolt() :
	rigid_body_2d.freeze = false
	#rigid_body_2d.visible = false
	bolt_released = true

func _on_texture_button_button_down() -> void:
	if hammer.hammer_picked :
		print(hammer.hammer_val)
		if abs(hammer.hammer_val) < hammer.hammer_good_threshold :
			bolt_out = 0
		else :
			if bolt_out > bolt_threshold :
				bolt_out = 1
			else :
				bolt_out = 0
		hammer.hammer_picked = false
		return
	
	bolt_out = 1
