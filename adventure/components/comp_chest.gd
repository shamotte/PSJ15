extends Node2D

@export var object : Node
@export var anim : AnimationPlayer

var items_inside : Array[tool_item]
var chest_menu : Node

func _process(delta):
	var body_rotation : float = object.rotation
	rotation = -body_rotation
	
func open_chest_menu(character :Node):
	anim.play("open")
	chest_menu = character.get_chest_menu()
	chest_menu.open_window(self)
	chest_menu.set_items(items_inside)
	print("Open chest")
	
func add_item(item : tool_item):
	print("adding",item.name)
	items_inside.push_back(item)
	
func set_items_inside(new_items :Array[tool_item]):
	items_inside = new_items
	
	
func close_chest():
	anim.play("close")

func show_tip(show : bool):
	$PressE.visible = show
	if chest_menu == null:
		return
	if !show and chest_menu.is_active():
		chest_menu.exit_window()
	
