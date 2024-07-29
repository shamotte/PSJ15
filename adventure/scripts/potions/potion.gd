extends Node2D
class_name Potion

@export var ui_icon : CompressedTexture2D

func get_icon():
	if ui_icon != null:
		return ui_icon
