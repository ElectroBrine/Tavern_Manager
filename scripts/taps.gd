extends Node2D

@onready var game_manager: Node = %GameManager
@onready var player: CharacterBody2D = %Player

func _on_button1_pressed() -> void:
	var drinks = game_manager.get_all_drinks().keys()
	if len(drinks) <= 0: return
	player.add_to_tray(drinks[0])

func _on_button2_pressed() -> void:
	var drinks = game_manager.get_all_drinks().keys()
	if len(drinks) <= 1: return
	player.add_to_tray(drinks[1])

func _on_button3_pressed() -> void:
	var drinks = game_manager.get_all_drinks().keys()
	if len(drinks) <= 2: return
	player.add_to_tray(drinks[2])

func _on_button4_pressed() -> void:
	var drinks = game_manager.get_all_drinks().keys()
	if len(drinks) <= 3: return
	player.add_to_tray(drinks[3])
