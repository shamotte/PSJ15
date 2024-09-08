extends StaticBody2D


var hp = 3
var chopped := false
@onready var fire_effect := $FireEffect
@onready var occluder := $LightOccluder2D

@export var fallen_tree : PackedScene   

func chop(context : Area2D):
	if not chopped:
		#print("choping")
		hp-=1
		if hp<=0:
			$Leaves.queue_free()
			occluder.visible = false
			chopped = true
			var tree = fallen_tree.instantiate()
			tree.global_position = global_position
			get_tree().get_root().get_node("WorldManager").world.get_node("Gatharable").add_child(tree)
			queue_free()
			#$fallenTree.visible = true
	
func start_fire(context : Node2D):
	#print("burining")
	occluder.visible = false
	fire_effect.visible = true
	fire_effect.emitting = true
	$Leaves.queue_free()
	
