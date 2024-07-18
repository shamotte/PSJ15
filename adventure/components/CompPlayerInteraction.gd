extends Area2D

#@export var InteractionArea : Area2D

var Areas : Array[Area2D] 
var Areas_to_interact : Array[Area2D] 



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var old_Areas_to_interact : Array[Area2D] = Areas_to_interact
	Areas_to_interact = get_overlapping_areas()
	#Removing older
	for i in old_Areas_to_interact:
		if i not in Areas_to_interact:
			i.in_area(false)
	if len(Areas_to_interact) > 0:
		var Component : Area2D = min_distance(Areas_to_interact)
		Component.in_area(true)
	
func _input(event):
	if event.is_action_pressed("interact"):
		Areas = get_overlapping_areas()
		if len(Areas) > 0:
			var Component : Area2D = min_distance(Areas)
			Component.interacted()
			#Component.in_area(false)
		
func min_distance(area_array : Array[Area2D] ):
	var min_dist : float = 99999
	var index : Area2D
	for i in area_array:
		var dist : float  =  position.distance_squared_to(i.position)
		if min_dist > dist:
			min_dist = dist
			index = i
	return index
			

