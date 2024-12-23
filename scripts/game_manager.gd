extends Node

var gold = 0

# inventory is formatted as {name: {price: float, stock: int}}
var drink_inventor = {}
var food_inventor = {}
var pending_orders = {}

@onready var daytime: Timer = $GameTime

func _process(delta: float) -> void:
	#print(daytime.time_left)
	pass

func add_gold(amount):
	gold += amount
	print("gold added " + str(gold))

func add_drink(key, value = 1):
	var drink = drink_inventor.get_or_add(key)
	if drink == null or drink.is_empty():
		drink = {"price" = 10.0, "stock" = 1}
		drink_inventor[key] = drink
	else: drink["stock"] += value
	
func get_sellable_drinks():
	var drink_list = []
	for drink in drink_inventor.keys():
		if drink_inventor[drink]["stock"] - len(get_pending_orders(drink)) > 0: drink_list.append(drink)
	return drink_list

func get_all_drinks():
	return drink_inventor
	
func reduce_drink(drink):
	drink_inventor[drink]["stock"] -= 1
	
func get_pending_orders(drink):
	var orders = []
	for order in pending_orders:
		if order == drink: orders.append(order)
	return orders

func pend_order(order):
	pending_orders[order] += 1
