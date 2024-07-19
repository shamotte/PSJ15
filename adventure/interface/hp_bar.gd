extends Control

@export var character : Node
@export var hp_scene : PackedScene


var hp_component : Node

# Called when the node enters the scene tree for the first time.
func _ready():
	hp_component = character.get_node("CompHealth")
	for i in range(hp_component.get_current_hp()):
		var hp_icon = hp_scene.instantiate()
		$VBoxContainer.add_child(hp_icon)
	hp_component.connect("hp_changed",refresh_hp)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func refresh_hp():
	for i in $VBoxContainer.get_children():
		i.queue_free()
	for i in range(hp_component.get_current_hp()):
		var hp_icon = hp_scene.instantiate()
		$VBoxContainer.add_child(hp_icon)


