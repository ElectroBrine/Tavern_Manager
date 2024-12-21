extends Node

var score = 0

# inventory is formatted as {name: {price: float, stock: int}}
var drink_inventor = {}
var food_inventor = {}

@onready var daytime: Timer = $GameTime

func _process(delta: float) -> void:
	print(daytime.time_left)

func add_point():
	score += 1
	print(score)

func add_drink(key, value = 1):
	var drink = drink_inventor.get_or_add(key)
	if drink == null or drink.is_empty():
		drink = {"price" = 10.0, "stock" = 1}
		drink_inventor[key] = drink
	else: drink["stock"] += value
	
func get_drinklist():
	var drink_list = []
	for drink in drink_inventor.keys():
		if drink_inventor[drink]["stock"] > 0: drink_list.append(drink)
	return drink_list
