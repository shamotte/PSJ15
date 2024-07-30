extends Node2D

@export var character:Node
@export var fire : Node

@export var max_fuel : float
@export var fuel : float
@export var add_fuel_value:float

func _ready():
	fire.set_energy(energy_value())

func _process(delta):
	var body_rotation : float = character.rotation
	rotation = -body_rotation
	
func _on_timer_timeout():
	if fuel > 0:
		fuel -= 1
		fire.set_energy(energy_value())
	
func energy_value():
	#print(fuel/max_fuel)
	return float(fuel/max_fuel)
	
func add_fuel():
	fuel+=add_fuel_value
	if fuel > max_fuel:
		fuel = max_fuel
		fire.set_energy(energy_value())
		
func show_tip(show : bool):
	$PressE.visible = show
