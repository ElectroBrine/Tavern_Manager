extends Node2D

var interactable = true
var served = false
var tab = 0
var order = ""

@onready var cooldown: Timer = $Cooldown
@onready var game_manager: Node = %GameManager
@onready var game_time: Timer = %GameTime
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D
@onready var order_box: Node2D = $"Order Box"
@onready var label: Label = $"Order Box/Label"
@onready var call_box: Node2D = $"Call box"
@onready var player: CharacterBody2D = %Player
@onready var drink_timer: Timer = $"Drink timer"


func request():
	cooldown.wait_time = 10
	cooldown.start()
	if randf_range(0,1) <= 0.25: return
	call_box.visible = true
	var drinks = game_manager.get_sellable_drinks()
	order = drinks[randi_range(0, len(drinks)-1)]
	label.text = "one " + order + " please"

func recieve_drink(drink):
	served = true
	drink_timer.wait_time = randf_range(10,20)
	drink_timer.start()
	game_manager.reduce_drink(drink)
	call_box.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if interactable == true:
		if Input.is_action_just_pressed("interaction"):
			if has_order():
				player.remove_from_tray(order)
				recieve_drink(order)
			else: order_box.visible = true
	if !order.is_empty() && drink_timer.time_left == 0 && served:
		print("drunk")
		var drinks = game_manager.get_all_drinks()
		game_manager.add_gold(drinks[order]["price"])
		order = ""
		served = false
	if drink_timer.time_left == 0 && cooldown.time_left == 0 && len(game_manager.get_sellable_drinks()) > 0 && len(order) == 0:
		request()
		
func has_order():
	var tray = player.get_tray()
	if tray.has(order): return true
	return false


func _on_area_2d_body_entered(body: Node2D) -> void:
	interactable = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	interactable = false
	if order_box.visible == true:
		order_box.visible = false
