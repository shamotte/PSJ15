extends Area2D
class_name tool

@export var ui_name : String
@export var receiver : String
@export var ui_icon : CompressedTexture2D 


var active : bool = true
var player : Node2D

func _on_body_entered(area):
	#print(name)
	if active: 
		var rec : Receiver= area.get_node_or_null(receiver)
		if rec:
			rec.interacted(self);
			
func _on_area_entered(area : Area2D):
	#print(name)
	if active: 
		var rec : Receiver= area.get_node_or_null(receiver)
		if rec:
			rec.interacted(self);


func get_player() -> Node2D:
	return player


func set_active(state : bool)->void:
	active = state
	
func get_icon():
	if ui_icon != null:
		return ui_icon
