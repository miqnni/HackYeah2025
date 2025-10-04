extends Sprite2D
@onready var client: Sprite2D = $"../.."

func _process(delta: float) -> void:
	self.modulate = Color(client.order[0]/255.0,client.order[1]/255.0,client.order[2]/255.0)
