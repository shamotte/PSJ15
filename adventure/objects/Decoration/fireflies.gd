extends Area2D

@export var firefly : Ingridient

func _ready():
	$AnimationPlayer.play("idle")

func cought(t : tool):
	#print("fiefly cought")
	Global.add_to_table(firefly)
	t.get_player()
	$AnimationPlayer.play("disappear")
	
func remove():
	queue_free()
