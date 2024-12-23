extends CharacterBody2D

@export var SPEED = 130.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
var drink_tray = ["empty", "empty", "empty", "empty"]

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * SPEED

func _physics_process(delta: float) -> void:
	get_input()
	
	if velocity.x > 0:
		animated_sprite.flip_h = false
	elif velocity.x < 0:
		animated_sprite.flip_h = true
	
	if velocity.x + velocity.y == 0: animated_sprite.play("idle")
	else: animated_sprite.play("run")

	move_and_slide()

func add_to_tray(item):
	# adds item to drink tray
	#returns true when successful, returns false when unsuccessful
	if !drink_tray.has("empty"): return false
	for slot in range(0,len(drink_tray)):
		if drink_tray[slot] == "empty": 
			drink_tray[slot] = item
			break
	return true

func remove_from_tray(drink):
	for item in range(0,len(drink_tray)):
		if drink_tray[item] == drink: drink_tray[item] = "empty"

func get_tray():
	return drink_tray
