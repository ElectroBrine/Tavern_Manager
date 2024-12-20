extends Node

var score = 0

var drink_inventor = {}
var food_inventor = {}

@onready var daytime: Timer = $Timer

func _ready() -> void:
	daytime.start()
	
func _process(delta: float) -> void:
	print(daytime.time_left)

func add_point():
	score += 1
	print(score)
