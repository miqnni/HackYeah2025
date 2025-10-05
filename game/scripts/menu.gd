extends Node2D

func _on_start_button_down() -> void:
	hide()
	$Comic.start()
	

func _on_options_button_down() -> void:
	$"3places".hide()
	$"2places".show()

func _on_exit_button_down() -> void:
	pass
	
	
func _on_szczalka_button_down() -> void:
	$"2places".hide()
	$"3places".show()
