extends Area2D

#@export var InteractionArea : Area2D

var Areas : Array[Area2D] 



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if event.is_action_pressed("interact"):
		Areas = get_overlapping_areas()
		if len(Areas) > 0:
			var Component : Area2D = min_distance()
			Component.interacted()
		
func min_distance():
	var min_dist : float = 99999
	var index : Area2D
	for i in Areas:
		var dist : float  =  position.distance_squared_to(i.position)
		if min_dist > dist:
			min_dist = dist
			index = i
	return index
			

