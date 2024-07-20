extends Area2D
class_name tool

@export var ui_name : String
@export var receiver : String


var active : bool = true


func _on_body_entered(area):
	print("enterd")
	if active: 
		var rec : Receiver= area.get_node(receiver)
		if rec:
			rec.interacted(self);
			
func _on_area_entered(area : Area2D):
	print("enterd")
	if active: 
		var rec : Receiver= area.get_node(receiver)
		if rec:
			rec.interacted(self);
