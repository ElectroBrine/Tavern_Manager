extends Node2D

var interactable = true

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D
@onready var polygon_2d: Polygon2D = $"Polygon2D"
@onready var label: Label = $"Label"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if interactable == true:
		if Input.is_action_just_pressed("interaction"): 
			label.visible = true
			polygon_2d.visible = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	interactable = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	interactable = false
	if label.visible == true:
		label.visible = false
		polygon_2d.visible = false
