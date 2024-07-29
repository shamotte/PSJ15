extends ThrowablePotion



@onready var visual_effect : GPUParticles2D =  $ParticleEffect

func shatter():
	visual_effect.emitting = true
	var affected_objects := get_overlaping_objects()
	for obj in affected_objects:
		var node :Receiver= obj.get_node(receiver)
		if node != null:
			node.interacted(self)
	await visual_effect.finished
	queue_free()
	
