extends StaticBody2D

@export var max_fuel : float
@export var fuel : float

# Called when the node enters the scene tree for the first time.
func _ready():
	$fire.set_energy(energy_value())
	
func energy_value():
	print(fuel/max_fuel)
	return float(fuel/max_fuel)
	

