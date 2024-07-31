extends Node2D

@export_group("Important Nodes")
@export var character:Node
@export var fire : Node

@export_group("Fuel")
@export var max_fuel : float
@export var fuel : float
@export var add_fuel_value:float

@export_group("Particles")
@export var max_particles : int
var current_particles : int


func _ready():
	fire.set_energy(energy_value())

func _process(delta):
	var body_rotation : float = character.rotation
	rotation = -body_rotation
	
func _on_timer_timeout():
	if fuel > 0 and get_parent().can_extinguish():
		fuel -= 1
		fire.set_energy(energy_value())
		fire.set_amount_of_particles(amount_of_particles())
	
func energy_value():
	return float(fuel/max_fuel)
	
func amount_of_particles():
	return round(energy_value() * max_particles)
	#current_particles = 
	
func add_fuel():
	#print("add fuel")
	fuel+=add_fuel_value
	if fuel > max_fuel:
		fuel = max_fuel
		fire.set_energy(energy_value())
		
func show_tip(show : bool):
	if get_parent().can_extinguish():
		$PressE.visible = show
