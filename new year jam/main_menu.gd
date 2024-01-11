class_name MainMenu
extends Control

@onready var start = $HBoxContainer/VBoxContainer/Start as Button
@onready var options = $HBoxContainer/VBoxContainer/Options as Button
@onready var quit = $HBoxContainer/VBoxContainer/Quit as Button
@onready var start_level = preload("res://scenes/main/main.tscn") as PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	start.button_down.connect(on_start_pressed)
	quit.button_down.connect(on_quit_pressed)


func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)
	


func on_quit_pressed() -> void:
	get_tree().quit()
