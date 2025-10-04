extends Node2D

@onready var spawn_client_timer: Timer = $SpawnClientTimer

var client_count: int = 0
const client_slots_pos_x: Array[float] = [30.0, -140.0, -310.0, -480.0]
const client_pos_y: float = 189.562
var client_instances: Array[PackedScene] = []

var client_scene : PackedScene = preload("res://scenes/client.tscn")

func _ready() -> void:
	spawn_client_timer.start()

func _on_spawn_client_timer_timeout() -> void:
	spawn_client_timer.stop()
	
	if client_count < 4:
		print("New client spawned!")
		client_count += 1
		
		# Instantiate a new client and add it to the array.
		# Initialize the newly created client with their
		# order's details (color) and position (and rage meter???).
		var client = client_scene.instantiate()
		client_instances.append(client)
		client.position = Vector2(
			client_slots_pos_x[client_count - 1],
			client_pos_y
		)
		print("local: " + str(client.position.x) + ", " + str(client.position.y) + " / global: " + str(client.global_position.x) + ", " + str(client.global_position.y))
		add_child(client)
		
		# ...
	else:
		print("Game Over (Client Version)")
		# ...
		return
	
	var next_spawn_time = randf_range(1.0, 10.0)
	spawn_client_timer.start(next_spawn_time)

func remove_client(client_instance_to_remove):
	for i in range(client_instances.size()):
		if client_instances[i].name == client_instance_to_remove.name:
			client_instances.remove_at(i)
			client_instance_to_remove.free()

# Spawn a client when the timer goes off - MOVED TO CLIENT LINE WITH ANOTHER TIMER
#func _on_timer_timeout() -> void:
	##timer.stop()
	##if clients<4:
		## ...
		## TODO: Change it! Instead of showing a pre-rendered client, just
		## spawn another scene instance and add it to the array
		#
		##clients+=1 # add a client
		##clients_table[clients-1].new_order()
		##clients_table[clients-1].show()
		##print(clients)
		##pass
