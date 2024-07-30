extends GPUParticles2D

func set_energy(value:float):
	$latarnia.energy = value

func set_amount_of_particles(value:int):
	if value > 0: 
		amount = value
		emitting = true
		return
	emitting = false	
