extends Sprite2D
@onready var main_area: Node2D = $".."

var tex_table=[]
var pot_table=[]
var pot_fill_table=[]
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
	var pot1 = load("res://assets/Potek 1 .png")
	var pot1_f = load("res://assets/Potek 1 płyn .png")
	var pot2 = load("res://assets/Potek 2.png")
	var pot2_f = load("res://assets/Potek 2 płyn .png")
	var pot3 = load("res://assets/Potek 3 .png")
	var pot3_f = load("res://assets/Potek 3 płyn .png")
	var pot4 = load("res://assets/Potek 4 .png")
	var pot4_f = load("res://assets/Potek 4 płyn .png")
	var pot5 = load("res://assets/Potek 5.png")
	var pot5_f = load("res://assets/Potek 5 płyn .png")
	pot_table=[pot1,pot2,pot3,pot4,pot5]
	pot_fill_table=[pot1_f,pot2_f,pot3_f,pot4_f,pot5_f]

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

func roll_pot_texture():
	var tex = randi_range(0,4)
	$ClientOrderPopUp/Sprite2D2.texture=pot_table[tex]
	$ClientOrderPopUp/Sprite2D.texture=pot_fill_table[tex]
