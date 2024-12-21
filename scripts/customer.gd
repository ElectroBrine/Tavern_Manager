extends Node2D

var interactable = true
var drink_timer = 0
var tab = 0
var cooldown = Timer.new()
var order = ""

@onready var game_manager: Node = %GameManager
@onready var game_time: Timer = %GameTime
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D
@onready var order_box: Node2D = $"Order Box"
@onready var label: Label = $"Order Box/Label"
@onready var call_box: Node2D = $"Call box"

func request():
	cooldown.wait_time = 10
	cooldown.start()
	if randf_range(0,1) <= 0.9: return
	call_box.visible = true
	var drinks = game_manager.get_drinklist()
	order = drinks[randi_range(0, len(drinks)-1)]
	label.text = "one " + order + " please"

func _ready() -> void:
	cooldown.one_shot = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if interactable == true:
		if Input.is_action_just_pressed("interaction"): 
			order_box.visible = true
	if drink_timer == 0 && cooldown.time_left == 0 && len(game_manager.get_drinklist()) > 0 && len(order) == 0: request()

func _on_area_2d_body_entered(body: Node2D) -> void:
	interactable = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	interactable = false
	if order_box.visible == true:
		order_box.visible = false
