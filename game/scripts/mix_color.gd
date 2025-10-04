extends Sprite2D
@onready var mix_table: Node2D = $"../.."

func _process(delta: float) -> void:
	self.modulate = Color(mix_table.Red/255.0, mix_table.Green/255.0, mix_table.Blue/255.0)
