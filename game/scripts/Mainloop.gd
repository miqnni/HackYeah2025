# TU SIĘ DZIEJE SPAGHETTI

extends Node2D
@onready var timer: Timer = $Timer
#@onready var client_1: Sprite2D = $Client1
#@onready var client_2: Sprite2D = $Client2
#@onready var client_3: Sprite2D = $Client3
#@onready var client_4: Sprite2D = $Client4
@onready var mix_table: Node2D = $Mix_table

#var clients=0
#var orders=[]
#var clients_table = []
var A = 1.0

var client_count: int = 0
var client_list: Array[PackedScene] = [] 

func _process(_delta: float) -> void:
	#if clients<4:
		#client_4.hide()
	#if clients<3:
		#client_3.hide()
	#if clients<2:
		#client_2.hide()
	#if clients<1:
		#client_1.hide()
	pass
	
	if client_count > 4:
		pass # TODO: Game Over (Clients Version)

	
	pass
	

func _ready() -> void:
	#clients_table=[client_1,client_2,client_3,client_4]
	timer.start()

# Spawn a client when the timer goes off
func _on_timer_timeout() -> void:
	timer.stop()
	#if clients<4:
		# ...
		# TODO: Change it! Instead of showing a pre-rendered client, just
		# spawn another scene instance and add it to the array
		
		#clients+=1 # add a client
		#clients_table[clients-1].new_order()
		#clients_table[clients-1].show()
		#print(clients)
		#pass
		
		
	var time = randf_range(1.0, 10.0)
	timer.start(time)

func score(order) -> float:
	return A*(((255-abs(mix_table.Red-order[0]))/255.0+(255-abs(mix_table.Green-order[1]))/255.0+(255-abs(mix_table.Blue-order[2]))/255.0)/3.0-(A-1)/A)

func free_client(nr):
	#for i in range(nr,3):
		#clients_table[i].order=clients_table[i+1].order # move orders, TODO: CHANGE IT
	#clients-=1
	
	pass
