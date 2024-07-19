extends Control

@export var character : Node
@export var best_sanity_sprite : CompressedTexture2D
@export var good_sanity_sprite : CompressedTexture2D
@export var bad_sanity_sprite : CompressedTexture2D
@export var worse_sanity_sprite : CompressedTexture2D
	
	
var current_value : int
var max_value : int

var sanity_component : Node
# Called when the node enters the scene tree for the first time.
func _ready():
	sanity_component = character.get_node("CompSanity")
	sanity_component.connect("sanity_changed",refresh_sanity)
	current_value = sanity_component.get_current_sanity()
	max_value = sanity_component.get_max_sanity()
	$ProgressBar.value = current_value
	$ProgressBar.max_value = max_value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func refresh_sanity():
	current_value = sanity_component.get_current_sanity()
	$ProgressBar.value = current_value
	if current_value > 0.75 * max_value:
		$TextureRect.texture = best_sanity_sprite
		return
	if current_value > 0.5 * max_value:
		$TextureRect.texture = good_sanity_sprite
		return
	if current_value > 0.25 * max_value:
		$TextureRect.texture = bad_sanity_sprite
		return
	if current_value > 0:
		$TextureRect.texture = worse_sanity_sprite
		return
	
