extends Node2D

@export var light_color: Color = Color.WHITE
@export var light_radius: int = 64
@export var flicker: int = 0

var flicker_timer: int = 0

func _ready():
	$PointLight2D.texture.gradient.set_color(0, light_color)
	$PointLight2D.texture.set_width(light_radius * 2)
	$PointLight2D.texture.set_height(light_radius * 2)
	
func _physics_process(delta):
	if flicker != 0:
		var size = light_radius * 2 + flicker * sin(deg_to_rad(flicker_timer))
		$PointLight2D.texture.set_width(size)
		$PointLight2D.texture.set_height(size)
		flicker_timer += 1
