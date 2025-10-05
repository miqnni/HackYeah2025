extends Sprite2D
@onready var main_area: Node2D = $".."

var tex_table=[]
var order = [0,0,0]
var score = 0

func _ready() -> void:
	var tex1 = load("res://assets/npc1.png")
	var tex2 = load("res://assets/npc2.png")
	var tex3 = load("res://assets/npc3.png")
	var tex4 = load("res://assets/npc4.png")
	var tex5 = load("res://assets/npc5.png")
	var tex6 = load("res://assets/npc6.png")
	tex_table=[tex1,tex2,tex3,tex4,tex5,tex6]

func new_order():
	order = [randi_range(0, 255),randi_range(0, 255),randi_range(0, 255)]
	var tex = randi_range(0,5)
	texture=tex_table[tex]

func submit():
	if name=="Client1":
		score = main_area.score(order)
		print(score)
		#SCORE ANIMATION
		#var nr = int(str(name)[6])
		#print(nr)
		main_area.free_client(0)
