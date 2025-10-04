extends Node2D

@onready var button: Button = $Button
@onready var rigid_body_2d: RigidBody2D = $RigidBody2D
@onready var collision_shape_2d: CollisionShape2D = $RigidBody2D/CollisionShape2D

func _ready() :
	rigid_body_2d.freeze = true

func release_bolt() :
	rigid_body_2d.freeze = false
	rigid_body_2d.visible = false

func _on_button_button_down() -> void:
	release_bolt()
	button.visible = false
