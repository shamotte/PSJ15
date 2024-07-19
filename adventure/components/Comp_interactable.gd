extends Node2D
class_name InteractionArea

@export_group("Interaction")
@export var object : Node
@export var function_name : String 
@export var player_state : String
var to_interact : Callable

@export_group("In Area")
@export var in_area_object : Node
@export var in_area_function_name : String 
var in_area_of_interaction : Callable

@export_group("End Interaction")
@export var end_interaction_object : Node
@export var end_interaction_function_name : String 
@export var next_player_state : String
var end_of_interaction : Callable



var tip_active : bool = true

func _ready():
	if object != null and function_name != "":
		to_interact = Callable(object,function_name)
	if in_area_object != null and in_area_function_name != "":
		in_area_of_interaction = Callable(in_area_object,in_area_function_name)
	if end_interaction_object != null and end_interaction_function_name != "":
		end_of_interaction = Callable(end_interaction_object,end_interaction_function_name)

func interacted():
	if object != null and function_name != "":
		tip_active = false
		to_interact.call()
		return player_state
	return "nothing"
	
func in_area(is_true: bool):
	if in_area_object != null and in_area_function_name != "":
		in_area_of_interaction.call(is_true)
	
func end_interaction():
	if end_interaction_object != null and end_interaction_function_name != "":
		end_of_interaction.call()
		return next_player_state
	return "nothing" 

