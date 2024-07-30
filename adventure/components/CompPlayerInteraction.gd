extends Area2D

#@export var InteractionArea : Area2D

var Areas : Array[Area2D] 
var Areas_to_interact : Array[Area2D] 

var current_state : String

var Interacted_component : Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var old_Areas_to_interact : Array[Area2D] = Areas_to_interact
	Areas_to_interact = get_overlapping_areas()
	#Removing older
	for i in old_Areas_to_interact:
		if i != null:
			if i not in Areas_to_interact:
				if i.has_method("in_area"):
					i.in_area(false)
	#interactable object
	if len(Areas_to_interact) > 0:
		var Component : Area2D = min_distance(Areas_to_interact)
		if Component.has_method("in_area"):
			Component.in_area(true)
		#Aura
		#for i in Areas_to_interact:
		#	if Component.has_method("aura"):
		#		Component.aura(get_parent())
	
#func _input(event):
	#if event.is_action_pressed("interact"):
		#Areas = get_overlapping_areas()
		#if len(Areas) > 0:
			#Interacted_component = min_distance(Areas)
			#if Interacted_component.has_method("interacted"):
				#current_state = Interacted_component.interacted(get_parent())
				#get_parent().change_state(current_state)
				#Component.in_area(false)

func interact() -> String:
	Areas = get_overlapping_areas()
	if len(Areas) > 0:
		Interacted_component = min_distance(Areas)
		if Interacted_component.has_method("interacted"):
			current_state = Interacted_component.interacted(get_parent())
			return current_state
	return "idle"
	
func interacted():
	if Interacted_component != null:
		current_state = Interacted_component.end_interaction()
	

func min_distance(area_array : Array[Area2D] ):
	var min_dist : float = 99999
	var index : Area2D
	for i in area_array:
		var dist : float  =  position.distance_squared_to(i.position)
		if min_dist > dist:
			min_dist = dist
			index = i
	return index
	
func get_current_state():
	return current_state
			

