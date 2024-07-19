extends Node2D


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


func _input(event):
	if event.is_action_pressed("one"):
		change_equipd_items(0)
	elif  event.is_action_pressed("two"):
		change_equipd_items(1)
	elif  event.is_action_pressed("three"):
		change_equipd_items(2)
	elif  event.is_action_pressed("four"):
		change_equipd_items(3)
	elif  event.is_action_pressed("five"):
		change_equipd_items(4)
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func change_equipd_items(index : int):
	print(index)
	wanted_tool = tools[index]
	
	
	animation_player.stop()
	animation_player.play("Take_item")
	
	

func change_item_scene():
	print("xx")
	if currnet_tool != null:
		hand.remove_child(currnet_tool)
	if wanted_tool != null:
		hand.add_child(wanted_tool)
	currnet_tool = wanted_tool

