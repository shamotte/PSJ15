extends Control

signal window_closed

#@export_group("essentials")
@export var tool_bar : Node
@export var item_slot : PackedScene
@export var no_item : tool_item

var items_inside : Array[tool_item]
var player_tool_bar : Array[tool_item]

var opened_chest : Node

var selected_item_slot : Node

func _ready():
	pass

func set_items(items: Array[tool_item]):
	var length = len(items)
	items_inside = items
	for i in %chestGrid.get_children():
		i.queue_free()
	length += %chestGrid.columns
	while((length % %chestGrid.columns) != 0):
		length+=1
	for i in range(length):
		var s = item_slot.instantiate()
		if i < len(items):
			s.set_chest_menu(self)
			s.set_item(items[i])
		else:
			s.set_chest_menu(self)
			s.set_item(no_item)
		%chestGrid.add_child(s) 
	set_player_items()
	#print("set items")
	
func set_player_items():
	player_tool_bar = tool_bar.get_tool_bar_items()
	for i in %playerGrid.get_children():
		i.queue_free()
	for i in player_tool_bar:
		var s = item_slot.instantiate()
		s.set_chest_menu(self)
		s.set_item(i)
		%playerGrid.add_child(s) 
	
func close_window():
	$Container.visible = false
	window_closed.emit()
	
func open_window(chest : Node):
	selected_item_slot = null
	opened_chest = chest
	$Container.visible = true
	
	#for i in range(5):
		#var s = item_slot.instantiate()
		#s.set_item(player_tool_bar[i])
		#%playerGrid.add_child(s) 
	#for i in range(len(items)):
	#	var s = item_slot.instantiate()
	#	s.item = items[i]
	#	%playerGrid.add_child(s) 
	
func select_item(button : Node):
	if selected_item_slot == null:
		selected_item_slot = button
	else:
		var item = button.item
		button.set_item(selected_item_slot.item)
		selected_item_slot.set_item(item)
		selected_item_slot = null
	#print("selected",button)
		
func remove_nulls(items : Array[tool_item]):
	var tidied_up_array : Array[tool_item]
	for i in items:
		if i == null:
			continue
		if i.name != "Null":
			tidied_up_array.push_back(i)
	return tidied_up_array
	
func update_items_inside():
	var items : Array[tool_item]
	for i in %chestGrid.get_children():
		items.push_back(i.item)
	return remove_nulls(items)
	
func update_tool_bar():
	var items : Array[tool_item]
	for i in %playerGrid.get_children():
		items.push_back(i.item)
	return items
		
func _on_button_pressed():
	exit_window()
	
func exit_window():
	opened_chest.close_chest()
	opened_chest.set_items_inside(update_items_inside())
	tool_bar.set_tool_bar(update_tool_bar())
	tool_bar.set_tool_bar_icons()
	close_window()
	
func is_active():
	return $Container.visible
