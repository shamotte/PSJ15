extends Control

@export var item : tool_item 
var chest_menu

func set_chest_menu(menu : Node):
	chest_menu = menu

func set_item(new_item:tool_item):
	item = new_item
	$Icon.texture = item.icon

func _on_pressed():
	chest_menu.select_item(self)
