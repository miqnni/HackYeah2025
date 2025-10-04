extends Node2D
@onready var mix_table: Node2D = $Mix_table # Cauldron
var A = 1.0

func score(order) -> float:
	return A*(((255-abs(mix_table.Red-order[0]))/255.0+(255-abs(mix_table.Green-order[1]))/255.0+(255-abs(mix_table.Blue-order[2]))/255.0)/3.0-(A-1)/A)
