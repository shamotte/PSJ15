extends Node2D

#@export var texture : CompressedTexture2D  
@export var amount : int = 1
@export var type : Ingridient

# Called when the node enters the scene tree for the first time.
func _ready():
	$texture.texture = type.adventure_sprite
	$CompGatherable.set_character(get_parent())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
