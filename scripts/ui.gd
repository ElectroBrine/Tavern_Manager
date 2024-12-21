extends Camera2D

@onready var game_manager: Node = %GameManager
@onready var clock: Label = $Clock


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#clock.text = str(game_manager.daytime.time_left)
