extends Control

@export var character : Node
@export var cost : Goods
@export var to_buy : Goods


signal trading

# Called when the node enters the scene tree for the first time.
func _ready():
	$Container/Payment.texture = cost.icon
	$Container/something.texture = to_buy.icon

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var body_rotation : float = character.rotation
	rotation = -body_rotation
	
func trade(character : Node):
	print("trade")
	if cost.type == Goods.GOODS.HP:
		var component : Node2D = character.get_node("CompHealth")
		component.deal_damage(cost.amount)
	if to_buy.type == Goods.GOODS.SANITY:
		var component : Node2D = character.get_node("CompSanity")
		component.increase_sanity(to_buy.amount)
	#TODO miejsce na wymianę rzeczy
	emit_signal("trading")
	show_trade(false)
	
func show_trade(show : bool):
	$Container.visible = show
