extends Node2D
@onready var timer: Timer = $Timer
@onready var client_1: Sprite2D = $Client1
@onready var client_2: Sprite2D = $Client2
@onready var client_3: Sprite2D = $Client3
@onready var mix_table: Node2D = $Mix_table
@onready var timer_2: Timer = $Timer2

var clients=0
var orders=[]
var clients_table = []
var A = 1.0

func _process(delta: float) -> void:
	if clients<3:
		client_3.hide()
	if clients<2:
		client_2.hide()
	if clients<1:
		client_1.hide()
	

func _ready() -> void:
	clients_table=[client_1,client_2,client_3]
	timer.start()

func _on_timer_timeout() -> void:
	if $"..".RUNNING:
		timer.stop()
		if clients<3:
			clients+=1
			clients_table[clients-1].new_order()
			$AnimationPlayer.play("wejscie" + str(clients))
		else:
			$"..".game_over(1)
			return
	var time = randf_range(10.0, 30.0)
	timer.start(time)

func score(order) -> float:
	return A*(((255-abs(mix_table.Red-order[0]))/255.0+(255-abs(mix_table.Green-order[1]))/255.0+(255-abs(mix_table.Blue-order[2]))/255.0)/3.0-(A-1)/A)

func free_client(nr):
	$AnimationPlayer.play("new_animation")
	timer_2.start()


func _on_timer_2_timeout() -> void:
	timer_2.stop()
	client_1.roll_pot_texture()
	for i in range(2):
		clients_table[i].order=clients_table[i+1].order
		clients_table[i].texture=clients_table[i+1].texture
	$AnimationPlayer.play("RESET")
	clients-=1
	
	
	
