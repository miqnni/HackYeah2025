extends Node

var Red = 255
var Green = 255
var Blue = 255

var h_red=false
var h_green=false
var h_blue=false
var h_del=false

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
	#print("Red: ",Red," Green: ",Green," Blue: ",Blue)

#func wait_before_next_animation_iteration(full_animation_time: float) -> bool:
	#var remaining_time = (full_animation_time - $AnimationPlayer.current_animation_position) * (1 / $AnimationPlayer.speed_scale)
	#print("> " + str(remaining_time))
	#print("> " + str(remaining_time > 0.3 && remaining_time < full_animation_time * (1 / $AnimationPlayer.speed_scale)))
	#return remaining_time > 0.3 * (1 / $AnimationPlayer.speed_scale) && remaining_time < full_animation_time * (1 / $AnimationPlayer.speed_scale)

func wait_for_animation_finish(full_animation_time: float) -> void:
	var remaining_time = (full_animation_time - $AnimationPlayer.current_animation_position) * (1 / $AnimationPlayer.speed_scale)
	if remaining_time < 0:
		remaining_time = 0
	print(remaining_time)
	await get_tree().create_timer(remaining_time * 0.9).timeout
	pass

# RED, 2.75
func _on_button_button_down() -> void:
	#if $AnimationPlayer.is_playing():
		#return
	$mixtures/red_kula.show()
	$AnimationPlayer.play("red_kula")
	h_red=true


func _on_button_button_up() -> void:
	await wait_for_animation_finish(2.75)
	$AnimationPlayer.stop()
	$mixtures/red_kula.hide()
	h_red=false
	
# GREEN, 2.75
func _on_button_2_button_down() -> void:
	$mixtures/green_kula.show()
	$AnimationPlayer.play("green_kula")
	h_green=true
	

func _on_button_2_button_up() -> void:
	await wait_for_animation_finish(2.75)
	$AnimationPlayer.stop()
	$mixtures/green_kula.hide()
	h_green=false
	

# BLUE, 2.0
func _on_button_3_button_down() -> void:
	$mixtures/blue_kula.show()
	$AnimationPlayer.play("blue_kula")
	h_blue=true
	

func _on_button_3_button_up() -> void:
	await wait_for_animation_finish(2.0)
	$AnimationPlayer.stop()
	$mixtures/blue_kula.hide()
	h_blue=false
	
# BECZKA, 2.0
func _on_button_4_button_down() -> void:
	$mixtures/beczka_kula.show()
	$AnimationPlayer.play("beczka_kula")
	h_del=true

func _on_button_4_button_up() -> void:
	await wait_for_animation_finish(2.0)
	$AnimationPlayer.stop()
	$mixtures/beczka_kula.hide()
	h_del=false
