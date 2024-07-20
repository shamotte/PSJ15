extends Node2D
class_name InteractionArea

@onready var parent : Node = get_parent() 

enum types {INTERACTION,IN_AREA,END_INTERACTION}

@export_group("function_row")
@export var more_interactions : bool = false
@export var more_area : bool = false
@export var more_end_interactions : bool = false

@export_group("Interaction")
@export var interactable_array : Array[InteractionComponent]
var to_interact : Callable
var to_interact_index : int = 0

@export_group("In Area")
@export var in_area_array : Array[InteractionComponent]
var in_area_of_interaction : Callable
var in_area_of_interaction_index : int = 0

@export_group("End Interaction")
@export var end_interaction_array : Array[InteractionComponent]
var end_of_interaction : Callable
var end_of_interaction_index : int = 0

#@export var object : Node
#@export var function_name : String 
#@export var player_state : String
#var to_interact : Callable

#@export_group("In Area")
#@export var in_area_object : Node
#@export var in_area_function_name : String 
#var in_area_of_interaction : Callable

#@export_group("End Interaction")
#@export var end_interaction_object : Node
#@export var end_interaction_function_name : String 
#@export var next_player_state : String
#var end_of_interaction : Callable



var tip_active : bool = true

func _ready():
	if not_null(interactable_array[to_interact_index]):
		to_interact = set_Callable(interactable_array[to_interact_index])
		connect_new_signal(interactable_array,to_interact_index,types.INTERACTION)
	if not_null(in_area_array[in_area_of_interaction_index]):	
		in_area_of_interaction = set_Callable(in_area_array[in_area_of_interaction_index])
		connect_new_signal(in_area_array,in_area_of_interaction_index,types.IN_AREA)
	if not_null(end_interaction_array[end_of_interaction_index]):	
		end_of_interaction = set_Callable(end_interaction_array[end_of_interaction_index])
		connect_new_signal(end_interaction_array,end_of_interaction_index,types.END_INTERACTION)


func interacted(trigger_node : Node):
	if not_null(interactable_array[to_interact_index]):
		tip_active = false
		if interactable_array[to_interact_index].first_argument == "":
			to_interact.call()
		else:
			to_interact.call(trigger_node)
		return interactable_array[to_interact_index].player_state
	return "nothing"
	
func in_area(is_true: bool):
	if not_null(in_area_array[in_area_of_interaction_index]):	
		in_area_of_interaction.call(is_true)
	
func end_interaction():
	if not_null(end_interaction_array[end_of_interaction_index]):	
		end_of_interaction.call()
		return end_interaction_array[end_of_interaction_index].player_state
	return "nothing"
	#return "nothing" 

func not_null(Component : InteractionComponent):
	if Component.object != "" and Component.function_name != "":
		return true
	return false
	
func set_Callable(Component : InteractionComponent):
	var function : Callable = Callable(parent.get_node(Component.object),Component.function_name)
	if Component.first_argument != "":
		function.bind(Component.first_argument)
		#return Callable(parent.get_node(Component.object),Component.function_name,Component.first_argument)
	#else:
	#	return Callable(parent.get_node(Component.object),Component.function_name)
	return function
	
func connect_new_signal(Component_array : Array[InteractionComponent],index : int,type : int):
	if type == types.INTERACTION and Component_array[index].next_interaction_signal != "":
		if index > 0:
			if parent.get_node(Component_array[index-1].object).is_connected(Component_array[index-1].next_interaction_signal,next_interaction):
				parent.get_node(Component_array[index-1].object).disconnect(Component_array[index-1].next_interaction_signal,next_interaction)
		parent.get_node(Component_array[index].object).connect(Component_array[index].next_interaction_signal,next_interaction)
	if type == types.IN_AREA and Component_array[index].next_interaction_signal != "":
		if index > 0:
			if parent.get_node(Component_array[index-1].object).is_connected(Component_array[index-1].next_interaction_signal,next_interaction):
				parent.get_node(Component_array[index-1].object).disconnect(Component_array[index-1].next_interaction_signal,next_interaction)
		parent.get_node(Component_array[index].object).connect(Component_array[index].next_interaction_signal,next_area)
		
func next_interaction():
	if more_interactions:
		if to_interact_index < len(interactable_array) - 1:
			if not_null(interactable_array[to_interact_index+1]):
				to_interact_index += 1
				to_interact = set_Callable(interactable_array[to_interact_index])
				connect_new_signal(interactable_array,to_interact_index,types.INTERACTION)
				print("Next Interaction")
				
func next_area():
	if more_area:
		if in_area_of_interaction_index < len(in_area_array) - 1:
			if not_null(in_area_array[in_area_of_interaction_index+1]):
				in_area_of_interaction_index += 1
				in_area_of_interaction = set_Callable(in_area_array[in_area_of_interaction_index])
				connect_new_signal(in_area_array,in_area_of_interaction_index,types.IN_AREA)
				print("Next Interaction")
				
func next_end_interaction():
	if more_end_interactions:
		if end_of_interaction_index < len(end_interaction_array) - 1:
			if not_null(end_interaction_array[end_of_interaction_index+1]):
				end_of_interaction_index += 1
				in_area_of_interaction = set_Callable(end_interaction_array[end_of_interaction_index])
				connect_new_signal(end_interaction_array,end_of_interaction_index,types.END_INTERACTION)
				print("Next Interaction")
		
