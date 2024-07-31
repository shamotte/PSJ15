extends Node2D
class_name CombinedScenes

@onready var world = $World
@onready var crafting = $Crafting
enum STATE{ WORLD, CRAFTING}
var state = STATE.WORLD

var chest

func _input(event):
	return
	if event is InputEventKey:
		if event.keycode == KEY_P:
			change_to_world()
		elif event.keycode == KEY_O:
			change_to_crafting()

func _ready():
	chest = get_tree().get_first_node_in_group("crafting_chest")
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
	
	
