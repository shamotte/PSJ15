extends Control

func _ready():
	Global.connect("item_send",show_info)
	
func show_info(resource : Ingridient):
	$AnimationPlayer.play("show_info")
	$TextureRect/Label.text = resource.name + " has been added to inventory."
	print(resource.name)
