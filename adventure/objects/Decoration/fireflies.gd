extends Area2D

@export var firefly : PackedScene

func _ready():
	$AnimationPlayer.play("idle")

func cought(t : tool):
	print("fiefly cought")
	if firefly != null:
		var loot = firefly.instantiate()
		loot.position = Vector2(randf_range(-200, 200), randf_range(-200,200))
		get_tree().get_root().get_node("WorldManager").crafting.get_node("MovableObjects").add_child(loot)
	t.get_player()
	$AnimationPlayer.play("disappear")
	
func remove():
	queue_free()
