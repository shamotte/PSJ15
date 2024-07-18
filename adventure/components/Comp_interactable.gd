extends Node2D
class_name InteractionArea

@export var object : Node
@export var function_name : String 

var to_interact : Callable

func _ready():
	to_interact = Callable(object,function_name)

func interacted():
	to_interact.call()
