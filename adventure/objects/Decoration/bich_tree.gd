extends StaticBody2D


var hp = 3
@onready var fire_effect := $FireEffect
@onready var occluder := $LightOccluder2D

func chop(context : Area2D):
	print("choping")
	hp-=1
	if hp<=0:
		queue_free()
		
func start_fire(context : Node2D):
	print("burining")
	occluder.visible = false
	fire_effect.visible = true
	fire_effect.emitting = true
