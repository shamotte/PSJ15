extends CharacterBody2D

@export var animation_name : String

func _ready():
	if animation_name == "":
		$AnimationPlayer.play("idle")
		return
	$AnimationPlayer.play(animation_name)
