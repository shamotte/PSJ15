extends Area2D
class_name tool

@export var ui_name : String
@export var receiver : String


var active : bool = true
var player : Node2D

func _on_body_entered(area):
	if active: 
		var rec : Receiver= area.get_node(receiver)
		if rec:
			rec.interacted(self);
			
func _on_area_entered(area : Area2D):
	if active: 
		var rec : Receiver= area.get_node(receiver)
		if rec:
			rec.interacted(self);


func get_player() -> Node2D:
	return player


func set_active(state : bool)->void:
	active = state
