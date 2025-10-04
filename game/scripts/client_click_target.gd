extends Area2D
@onready var client: Sprite2D = $".."

func _input_event(viewport, event, shape_idx):
	if event.is_action_pressed("left_click"):
		client.submit()
		

func _on_mouse_entered() -> void:
	$"../ClientOrderPopUp".show()
	

func _on_mouse_exited() -> void:
	$"../ClientOrderPopUp".hide()
