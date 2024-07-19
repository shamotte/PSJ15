extends Control

@export var character : Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var body_rotation : float = character.rotation
	rotation = -body_rotation
	
func show_trade(show : bool):
	$Container.visible = true
