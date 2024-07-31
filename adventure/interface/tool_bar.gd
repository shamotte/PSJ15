extends Control

@export var tool_frame : PackedScene
@export var number_of_items : int
@export var tool_bar_items : Array[tool_item]
@export var no_item : tool_item

signal tool_bar_loaded
signal tool_bar_changed
#signal 

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(number_of_items):
		var frame = tool_frame.instantiate()
		frame.get_node("SlotNumber").text = str(i+1)
		$HBoxContainer.add_child(frame)
	set_tool_bar_icons()
	tool_bar_loaded.emit()

func set_tool_bar_icon(index : int,icon : CompressedTexture2D):
	if index >= 0 and index < number_of_items:
		$HBoxContainer.get_child(index).get_node("Icon").texture = icon
		
func set_tool_bar_icons():
	for i in range(number_of_items):
		$HBoxContainer.get_child(i).get_node("Icon").texture = tool_bar_items[i].icon
		tool_bar_changed.emit()
		
func set_tool_bar(tools :Array[tool_item]):
	tool_bar_items = tools
	#if index >= 0 and index < number_of_items:
	#	$HBoxContainer.get_child(index).get_node("Icon").texture = icon

func get_tool_bar_items():
	return tool_bar_items

func remove_potion(index: int):
	tool_bar_items[index] = no_item
	set_tool_bar_icons()
