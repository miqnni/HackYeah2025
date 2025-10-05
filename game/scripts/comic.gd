extends Node2D
@onready var timer: Timer = $Timer
@onready var button: Button = $Button
@onready var sc1: Sprite2D = $Sprite2D/Sprite2D
@onready var sc2: Sprite2D = $Sprite2D/Sprite2D2
@onready var sc3: Sprite2D = $Sprite2D/Sprite2D3
@onready var sc4: Sprite2D = $Sprite2D/Sprite2D4
@onready var sc5: Sprite2D = $Sprite2D/Sprite2D5

var page=1

func start():
	$AnimationPlayer.play("comic1")
	timer.start(7)

func _on_timer_timeout() -> void:
	timer.stop()
	button.show()


func _on_button_button_down() -> void:
	button.hide()
	sc1.hide()
	sc2.hide()
	sc3.hide()
	sc4.hide()
	sc5.hide()
	if page==1:
		$AnimationPlayer.play("comic2")
		timer.start(5)
	if page==2:
		$AnimationPlayer.play("comic3")
		timer.start(5)
	if page==3:
		$AnimationPlayer.play("comic4")
		timer.start(9)
	if page==4:
		hide()
	page+=1

	
