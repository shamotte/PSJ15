extends Control

func _ready():
	Global.connect("item_send",show_info)
	
func show_info(resource : Ingridient):
	$AnimationPlayer.stop()
	$AnimationPlayer.play("show_info")
	$TextureRect/Label.text = resource.name + " has been added to inventory."
	#print(resource.name)
	
func show_info_potion(potion : tool_item):
	$AnimationPlayer.stop()
	$AnimationPlayer.play("show_info")
	$TextureRect/Label.text = potion.name + " has been added to crate."
	#print(potion.name)
