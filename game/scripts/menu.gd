extends Node2D
@onready var comic: Node2D = $"../Comic"

func _on_start_button_down() -> void:
	hide()
	comic.start_com()
	

func _on_options_button_down() -> void:
	$"3places".hide()
	$"2places".show()

func _on_exit_button_down() -> void:
	pass
	
	
func _on_szczalka_button_down() -> void:
	$"2places".hide()
	$"3places".show()
