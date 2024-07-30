extends CharacterBody2D

@export var damage : int =1 
@export var speed = 30
@onready var attack_area :Area2D= $attack_area
func change_velocity(direction : Vector2, factor: float) -> void:
	velocity = direction * speed * factor
	look_at(global_position + direction)
	

func deal_damage() -> void:
	for object in attack_area.get_overlapping_bodies():
		var n = object.get_node_or_null("CompHealth")
		if n:
			n.deal_damage(damage)

func _physics_process(delta):
	move_and_slide()
