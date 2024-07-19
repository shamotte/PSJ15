extends Node
class_name Receiver


@export var object : Node
@export var function_name : String 

var to_interact : Callable
func _ready():
	if object != null and function_name != "":
		to_interact = Callable(object,function_name)


func interacted():
	if to_interact != null:
		to_interact.call()
