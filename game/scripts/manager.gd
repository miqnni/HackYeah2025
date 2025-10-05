extends Node
#@onready var timer: Timer = $Timer

var Red = 255
var Green = 255
var Blue = 255

var h_red=false
var h_green=false
var h_blue=false
var h_del=false
#var can_press=true

func _ready() -> void:
	$mixtures/green_kula.hide();
	$mixtures/blue_kula.hide();
	$mixtures/red_kula.hide();
	$mixtures/beczka_kula.hide();

func _process(_delta: float) -> void:
	if h_red:
		if Green>0:
			Green-=1
		if Blue>0:
			Blue-=1
	if h_green:
		if Red>0:
			Red-=1
		if Blue>0:
			Blue-=1
	if h_blue:
		if Red>0:
			Red-=1
		if Green>0:
			Green-=1
	if h_del:
		if Blue<255:
			Blue+=1
		if Green<255:
			Green+=1
		if Red<255:
			Red+=1

func wait_for_animation_finish(full_animation_time: float, animation_player: AnimationPlayer) -> void:
	var remaining_time = (full_animation_time - animation_player.current_animation_position) * (1 / animation_player.speed_scale)
	if remaining_time < 0:
		remaining_time = 0
	print(remaining_time)
	await get_tree().create_timer(remaining_time).timeout
	pass

# RED, 2.75
func _on_button_button_down() -> void:
	#if !can_press:
		#return
	#timer.start()
	#can_press=false
	#if $AnimationPlayerRed.is_playing():
		#return
	$mixtures/red_kula.show()
	$AnimationPlayerRed.play("red_kula")
	h_red=true


func _on_button_button_up() -> void:
	await wait_for_animation_finish(2.75, $AnimationPlayerRed)
	$AnimationPlayerRed.stop()
	$mixtures/red_kula.hide()
	h_red=false

# GREEN, 2.75, scale 0.5
# 0.0: (190, -335)
# 0.5: (277, -335)
# 2.5: (277, 406)
# 2.75: (240, 468)
func _on_button_2_button_down() -> void:
	#if !can_press:
		#return
	#timer.start()
	#can_press=false
	$mixtures/green_kula.show()
	$AnimationPlayerGreen.play("green_kula")
	h_green=true
	

func _on_button_2_button_up() -> void:
	await wait_for_animation_finish(2.75, $AnimationPlayerGreen)
	$AnimationPlayerGreen.stop()
	$mixtures/green_kula.hide()
	h_green=false


# BLUE, 2.0
# 0.0: (-59, 45)
# 2.0: (-59, 240), scale 0.5
func _on_button_3_button_down() -> void:
	#if !can_press:
		#return
	#timer.start()
	#can_press=false
	$mixtures/blue_kula.show()
	$AnimationPlayerBlue.play("blue_kula")
	h_blue=true
	

func _on_button_3_button_up() -> void:
	await wait_for_animation_finish(2.0, $AnimationPlayerBlue)
	$AnimationPlayerBlue.stop()
	$mixtures/blue_kula.hide()
	h_blue=false
	
# BECZKA, 2.0
# 0.0: (118, 120)
# 0.6: (121, 140)
# 1.2: (72, 165)
# 2.0: (72, 245)
# Scale: 0.7
func _on_button_4_button_down() -> void:
	#if !can_press:
		#return
	#timer.start()
	#can_press=false
	$mixtures/beczka_kula.show()
	$AnimationPlayerBeczka.play("beczka_kula")
	h_del=true

func _on_button_4_button_up() -> void:
	await wait_for_animation_finish(2.0, $AnimationPlayerBeczka)
	$AnimationPlayerBeczka.stop()
	$mixtures/beczka_kula.hide()
	h_del=false


#func _on_timer_timeout() -> void:
	#timer.stop()
	#can_press=true
