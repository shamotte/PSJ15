extends Area2D

var active_points : Array[Vector2]
var all_points : Array[Vector2]
var rad :float = 80

var max_dist := 2000
@export var obj : PackedScene
@export var secondaey_objects : Array[PackedScene]
@export var repeats : int = 10
@onready var holder :Node2D = $"../Decoration"
@export var create_forest : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	if create_forest:
		all_points.push_back(Vector2( 200,200))
		var p : Array[Vector2] = [ Vector2( 1000,1000),Vector2( 0,0),Vector2( -100,-100)]
	
	
		var trees := place_trees(all_points.duplicate(true),rad)
		all_points.append_array(trees)
	
		place_gatherables(trees,rad)
	

func check_radius_existing(radius : float, place : Vector2)-> bool:
	var rsqu = radius * radius
	for p in all_points:
		if p.distance_squared_to(place) < rsqu:
			return false
	return true
func check_radius_own(points: Array[Vector2], radius : float, place : Vector2)-> bool:
	var rsqu = radius * radius
	for p in points:
		if p.distance_squared_to(place) < rsqu:
			return false
	return true
	
func in_bounding_box(point : Vector2) -> bool:
	if abs(point.x) > max_dist:
		return false 
	if abs(point.y) > max_dist:
		return false 
	return true


func check_restricted_area(point : Vector2) -> bool:
	var physics = get_world_2d().direct_space_state
	var params : PhysicsPointQueryParameters2D  = PhysicsPointQueryParameters2D.new()
	params.position = point
	params.collision_mask = 64
	params.collide_with_areas = true
	var results : =physics.intersect_point(params)
	return len(results) == 0
	


func place_trees(points : Array[Vector2], radius : float) -> Array[Vector2]:
	var trees : Array[Vector2] = []
	while len(points) > 0:
		var rep := true
		var counter := repeats
		var point :Vector2= points.pop_front()
		while rep:
			var spawned_object :Node2D= obj.instantiate()
			var new_point = point + Vector2(randf_range(-1,1),randf_range(-1,1)).normalized() * randf_range(radius,2*radius)
			spawned_object.global_position = new_point
			holder.add_child(spawned_object)

			if check_restricted_area(new_point) and check_radius_own(trees,radius,new_point) and in_bounding_box(new_point):
				counter = repeats
				trees.push_back(new_point)
				points.push_back(new_point)
				
			else:
				holder.remove_child(spawned_object)
				counter -= 1
				if counter <= 0:
					rep = false
					
	return trees
	
func place_gatherables(points : Array[Vector2], radius : float):
	
	for x in range(100):
		var spawned_object = secondaey_objects.pick_random().instantiate()
		var point = points.pick_random()
		var new_point = point + Vector2(randf_range(-1,1),randf_range(-1,1)).normalized() * randf_range(radius * 0.5,radius)
		spawned_object.global_position = new_point
		holder.add_child(spawned_object)

		if check_restricted_area(new_point) and in_bounding_box(new_point):
			points.push_back(new_point)
			
		else:
			holder.remove_child(spawned_object)
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
