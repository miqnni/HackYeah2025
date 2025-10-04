extends Area2D

func _input_event(viewport, event, shape_idx):
	if event.is_action_pressed("left_click"):
		print("Client clicked!")
		
		$"../ClientOrderPopUp".show()
