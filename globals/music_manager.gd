extends Node

func _ready():
	$ExplorationMusic.play()
	$CraftingMusic.play()
	$ExplorationMusic.stream_paused = true
	$CraftingMusic.stream_paused = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var world_manager = get_tree().get_root().get_node_or_null("WorldManager")
	
	if not $ExplorationMusic.playing and not $ExplorationMusic.stream_paused:
		$ExplorationMusic.play()
		
	if not $CraftingMusic.playing and not $CraftingMusic.stream_paused:
		$CraftingMusic.play()
	
	if world_manager != null:
		match world_manager.state:
			
			CombinedScenes.STATE.WORLD:
				$ExplorationMusic.stream_paused = false
				$CraftingMusic.stream_paused = true
				
			CombinedScenes.STATE.CRAFTING:
				$ExplorationMusic.stream_paused = true
				$CraftingMusic.stream_paused = false

