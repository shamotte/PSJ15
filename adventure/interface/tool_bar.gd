extends Control

@export var tool_frame : PackedScene
@export var number_of_items : int

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(number_of_items):
		var frame = tool_frame.instantiate()
		frame.get_node("SlotNumber").text = str(i+1)
		$HBoxContainer.add_child(frame)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
