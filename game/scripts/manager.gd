extends Node

var Red = 0
var Green = 0
var Blue = 0

var h_red=false
var h_green=false
var h_blue=false
var h_del=false

func _process(delta: float) -> void:
	if h_red and Red<256:
		Red+=1
	if h_green and Green<256:
		Green+=1
	if h_blue and Blue<256:
		Blue+=1
	if h_del:
		if Blue>0:
			Blue-=1
		if Green>0:
			Green-=1
		if Red>0:
			Red-=1
	print("Red: ",Red," Green: ",Green," Blue: ",Blue)

func _on_button_button_down() -> void:
	h_red=true


func _on_button_button_up() -> void:
	h_red=false
	

func _on_button_2_button_down() -> void:
	h_green=true
	

func _on_button_2_button_up() -> void:
	h_green=false
	

func _on_button_3_button_down() -> void:
	h_blue=true
	

func _on_button_3_button_up() -> void:
	h_blue=false
	
	
func _on_button_4_button_down() -> void:
	h_del=true

func _on_button_4_button_up() -> void:
	h_del=false
