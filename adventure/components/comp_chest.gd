extends Node2D

@export var object : Node
@export var anim : AnimationPlayer

@export var items_inside : Array[tool_item]


func _process(delta):
	var body_rotation : float = object.rotation
	rotation = -body_rotation
	
func open_chest_menu(character :Node):
	anim.play("open")
	var chest_menu : Node = character.get_chest_menu()
	chest_menu.open_window(self)
	chest_menu.set_items(items_inside)
	print("Open chest")
	
func set_items_inside(new_items :Array[tool_item]):
	items_inside = new_items
	for i in range(len(items_inside)):
		print(new_items[i].name)
	
func close_chest():
	anim.play("close")

func show_tip(show : bool):
	$PressE.visible = show
