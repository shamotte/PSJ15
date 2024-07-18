extends Node2D

@export var grab_area: Node

var mouse_hovering: bool = false

func _ready():
	grab_area.connect("mouse_entered", mouse_entered)
	grab_area.connect("mouse_exited", mouse_exited)

func mouse_entered():
	mouse_hovering = true

func mouse_exited():
	mouse_hovering = false

func _process(delta):
	$Label.text = str(get_parent().get_index())
