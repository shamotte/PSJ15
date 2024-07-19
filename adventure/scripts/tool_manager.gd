extends Node


@export var hand : Node2D

var currnet_tool : Node2D
var wanted_tool : Node2D
var animation_player : AnimationPlayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if animation_player.is_playing()
	
