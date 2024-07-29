extends Node2D

@export var player : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Position")
	player.position = $Spawn_point.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
