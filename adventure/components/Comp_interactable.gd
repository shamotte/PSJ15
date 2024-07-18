extends Node2D
class_name InteractionArea

@export_group("Interaction")
@export var object : Node
@export var function_name : String 

@export_group("In Area")
@export var in_area_object : Node
@export var in_area_function_name : String 

var to_interact : Callable
var in_area_of_interaction : Callable

var tip_active : bool = true

func _ready():
	if object != null and function_name != "":
		to_interact = Callable(object,function_name)
	if in_area_object != null and in_area_function_name != "":
		in_area_of_interaction = Callable(in_area_object,in_area_function_name)

func interacted():
	if object != null and function_name != "":
		tip_active = false
		to_interact.call()
	
func in_area(is_true: bool):
	in_area_of_interaction.call(is_true)
	#return
	#if !tip_active:
	#	$PressE.visible = false
	#	return
	#$PressE.visible = show_tip
	#if in_area_object != null and in_area_function_name != "":
	#	in_area_of_interaction.call()
	

