extends StaticBody2D

@export var items_inside : Array[tool_item]

func _ready():
	$AnimationPlayer.play("close")
	$CompChest.set_items_inside(items_inside)
