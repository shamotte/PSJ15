extends Node2D

@onready var world = $World
@onready var crafting = $Crafting
enum STATE{ WORLD, CRAFTING}
var state = STATE.WORLD

func _input(event):
	if event is InputEventKey:
		if event.keycode == KEY_P:
			change_to_world()
		elif event.keycode == KEY_O:
			change_to_crafting()

func _ready():
	remove_child(crafting)
	
	

func change_to_crafting():
	if state!= STATE.CRAFTING:
		remove_child(world)
		add_child(crafting)
		state= STATE.CRAFTING
func change_to_world():
	if state!= STATE.WORLD:
		remove_child(crafting)
		add_child(world)
		state= STATE.WORLD
	
	
