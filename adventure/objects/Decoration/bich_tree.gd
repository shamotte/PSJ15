extends StaticBody2D


var hp = 3

func chop(context : Area2D):
	print("choping")
	hp-=1
	if hp<=0:
		queue_free()
		
func start_fire(context : Node2D):
	print("burning")
