extends Node2D
class_name ToolManager

@export var hand : Node2D

@onready var  animation_player : AnimationPlayer = $"../AnimationPlayer"

@export var axe: PackedScene
@export var pick : PackedScene
@export var net : PackedScene
@onready var fp := preload("res://adventure/scripts/potions/fire_potion.tscn")


var currnet_tool : Node2D
var wanted_tool : Node2D 

@export var tools : Array
@export var character_tools : Array[tool_item]
var tool_index : int

var tool_bar : Node 

func _ready():
	tool_bar = get_parent().get_tool_bar()
	#tool_bar.connect("tool_bar_loaded",load_test_tools)
	tool_bar.connect("tool_bar_changed",load_tools)
	tools.resize(5)
	
func load_test_tools():
	tools[0] = axe.instantiate()
	tools[1] = pick.instantiate()
	tools[2] = net.instantiate()
	tools[3] = fp.instantiate()
	for i in range(len(tools)):
		if i < 4:
			tool_bar.set_tool_bar_icon(i,tools[i].get_icon())
			
func load_tools():
	for i in range(len(tools)):
		tools[i] = tool_bar.get_tool_bar_items()[i].player_tool.instantiate()


func _process(delta):
	pass



func change_equipd_items(index : int):
	wanted_tool = tools[index]
	tool_index = index
	

func change_item_scene():
	if currnet_tool != null:
		hand.remove_child(currnet_tool)
	if wanted_tool != null:
		hand.add_child(wanted_tool)
	currnet_tool = wanted_tool

func change_item_activation(state:bool):
	if currnet_tool != null:
		currnet_tool.active = state
		
func detach_potion():
	hand.remove_child(currnet_tool)
	get_tree().root.get_node("WorldManager/World/ProjectileManager").add_child(currnet_tool)
	currnet_tool = null
	tools[tool_index] = null
	tool_bar.remove_potion(tool_index)
		
		
func get_potion()-> Potion:
	return currnet_tool as Potion
	
func get_desired_animation()-> String:
	if currnet_tool is tool:
		return "swing"
	if currnet_tool is ThrowablePotion:
		return "charge_throw"
	if currnet_tool is DrinkablePotion:
		return "drink"
	return "idel"
