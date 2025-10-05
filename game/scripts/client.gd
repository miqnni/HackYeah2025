extends Sprite2D
@onready var client_line: Node2D = $".."

#signal client_clicked

var order = [0,0,0]
var score = 0

func new_order():
	order = [randi_range(0, 255),randi_range(0, 255),randi_range(0, 255)]

func submit():
	#if name=="Client1":
		#score = main_area.score(order)
		#print(score)
		#SCORE ANIMATION
		#var nr = int(str(name)[6])
		#print(nr)
		#main_area.free_client(0)
	
	# Get client's scores
	
	#score = main_area.score(order) # TODO
	#print(score)
	
	#free()
	#client_clicked.emit()
		
	pass

# TODO: Rage Meter
# - A timer should be used
# - On timeout: Game Over (Clients Version)
# - If the order is successfully submitted: stop timer, remove the instance
#   - MAYBE: get_owner().queue_free()
