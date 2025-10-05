extends Node2D
@onready var timer: Timer = $Timer
@onready var client_1: Sprite2D = $Client1
@onready var client_2: Sprite2D = $Client2
@onready var client_3: Sprite2D = $Client3
@onready var client_4: Sprite2D = $Client4
@onready var mix_table: Node2D = $Mix_table
@onready var timer_2: Timer = $Timer2

var clients=0
var orders=[]
var clients_table = []
var A = 1.0

func _process(delta: float) -> void:
	if clients<4:
		client_4.hide()
	if clients<3:
		client_3.hide()
	if clients<2:
		client_2.hide()
	if clients<1:
		client_1.hide()
	

func _ready() -> void:
	clients_table=[client_1,client_2,client_3,client_4]
	timer.start()

func _on_timer_timeout() -> void:
	timer.stop()
	if clients<4:
		clients+=1
		clients_table[clients-1].new_order()
		$AnimationPlayer.play("wejscie" + str(clients))
	var time = randf_range(1.0, 10.0)
	timer.start(time)

func score(order) -> float:
	return A*(((255-abs(mix_table.Red-order[0]))/255.0+(255-abs(mix_table.Green-order[1]))/255.0+(255-abs(mix_table.Blue-order[2]))/255.0)/3.0-(A-1)/A)

func free_client(nr):
	$AnimationPlayer.play("new_animation")
	timer_2.start()


func _on_timer_2_timeout() -> void:
	timer_2.stop()
	for i in range(3):
		clients_table[i].order=clients_table[i+1].order
		clients_table[i].texture=clients_table[i+1].texture
	clients-=1
	$AnimationPlayer.play("RESET")
