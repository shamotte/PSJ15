extends StaticBody2D

@export var hp = 1

func mine(context : Area2D):
	print("mining")
	hp-=1
	if hp<=0:
		queue_free()
