extends Node2D
class_name ToolManager

@export var hand : Node2D

@onready var  animation_player : AnimationPlayer = $"../AnimationPlayer"

@export var axe: PackedScene
@export var pick : PackedScene


var currnet_tool : Node2D
var wanted_tool : Node2D 

@export var tools : Array


func _ready():
	tools.resize(5)
	tools[0] = axe.instantiate()
	tools[1] = pick.instantiate()


func _process(delta):
	pass



func change_equipd_items(index : int):
	wanted_tool = tools[index]
	
	

func change_item_scene():
	if currnet_tool != null:
		hand.remove_child(currnet_tool)
	if wanted_tool != null:
		hand.add_child(wanted_tool)
	currnet_tool = wanted_tool

func change_item_activation(state:bool):
	if currnet_tool != null:
		currnet_tool.active = state
	
	
func get_desired_animation()-> String:
	return "swing"
