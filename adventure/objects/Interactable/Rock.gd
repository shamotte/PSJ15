extends StaticBody2D

@export var hp = 2
@export var object_sprites : Array[CompressedTexture2D]
@export var stage : Array[int]
@export var resource_type : Ingridient

var current_index : int = 0

func _ready():
	$object.texture = object_sprites[current_index]
	if len(stage) != len(object_sprites):
		#print("Rock arrays resized")
		stage.resize(len(object_sprites))

func mine(context : Area2D):
	#print("mining")
	hp-=1
	if hp < stage[current_index]:
		next_stage()
	if hp == 0:
		Global.add_to_table(resource_type)
		
func next_stage():
	if current_index+1  < len(object_sprites):
		current_index += 1
		$object.texture = object_sprites[current_index]
		
