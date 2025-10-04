# potka.gd to tak naprawde skrypt do koloru
# w zamowieniach KLIENTOW 

# Here we keep the client's ORDER: one of the crucial properties
# of the Client instance

# Crucial client's properties:
# - order color
# - sprite (randomly chosen from those which are not being displayed at the moment)
# - rage meter (NOT HERE: better keep it inside the Client's script)

extends Sprite2D
@onready var client: Sprite2D = $"../.."

func _process(_delta: float) -> void:
	self.modulate = Color(client.order[0]/255.0,client.order[1]/255.0,client.order[2]/255.0)
