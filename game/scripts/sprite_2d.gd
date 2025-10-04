extends Sprite2D

func _ready():
	print("okok")
	pass

func _process(delta):
	position.x += 200 * delta
	position.y += 100 * delta
