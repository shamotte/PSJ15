extends Potion
class_name ThrowablePotion

var charge_time : float = 5.0
var direction : Vector2
var speed := 100
var duration := 5.0
var flying : bool
@export var receiver : String 
@onready var  effect_area:Area2D = $Area2D

func get_overlaping_objects() -> Array:
	return effect_area.get_overlapping_areas() + effect_area.get_overlapping_bodies()

func throw(dir : Vector2):
	direction = dir
	flying = true
	duration = charge_time

func _process(delta):
	position += direction * delta * speed
	if flying:
		print(duration)
		duration -= delta
		if duration<0 :
			shatter()
			queue_free()

func shatter():
	pass
