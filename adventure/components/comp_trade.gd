extends Control

@export var character : Node

@export var cost_list : Array[Goods]
@export var to_buy_list : Array[Goods]

@export var cost : Goods
@export var to_buy : Goods

@export var note : Ingridient
var number_of_transactions : int = 0


signal trading

# Called when the node enters the scene tree for the first time.
func _ready():
	generate_trade()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var body_rotation : float = character.rotation
	rotation = -body_rotation
	
func trade(character : Node):
	number_of_transactions+=1
	if number_of_transactions == 1:
		Global.add_to_table(note)
	#print("trade")
	#cost
	if cost.type == Goods.GOODS.HP:
		var component : Node2D = character.get_node("CompHealth")
		component.deal_damage(cost.amount)
	if cost.type == Goods.GOODS.SANITY:
		var component : Node2D = character.get_node("CompSanity")
		component.deacrese_sanity(cost.amount)
	#to buy
	if to_buy.type == Goods.GOODS.HP:
		var component : Node2D = character.get_node("CompHealth")
		component.heal(to_buy.amount)
	if to_buy.type == Goods.GOODS.SANITY:
		var component : Node2D = character.get_node("CompSanity")
		component.increase_sanity(to_buy.amount)
	if to_buy.type == Goods.GOODS.EYE:
		Global.add_to_table(to_buy.ingridient)
	emit_signal("trading")
	generate_trade()
	show_trade(false)
	
func show_trade(show : bool):
	$Container.visible = show
	
func generate_trade():
	to_buy = to_buy_list[randi_range(0,len(to_buy_list))-1]
	cost = cost_list[randi_range(0,len(cost_list))-1]
	while cost.type == to_buy.type:
		cost = cost_list[randi_range(0,len(cost_list))-1]
	$Container/Payment.texture = cost.icon
	$Container/something.texture = to_buy.icon
	
