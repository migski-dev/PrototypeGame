extends Node

var player

@onready var main_menu = preload("res://main_menu.tscn") as PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	player = $MettiePath1/PathFollow2D/Player


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_astra_path_1_end_point_reached():
	DialogueManager.show_dialogue_balloon(load("res://dialogue/end_scene/end_scene_1.dialogue"), "start")
	await DialogueManager.dialogue_ended
	get_tree().change_scene_to_packed(main_menu)
	#$MettiePath1/PathFollow2D.remove_child(player)
	#$MettiePath2/PathFollow2D.add_child(player)
	#player.position = Vector2.ZERO
	#$MettiePath2/PathFollow2D.unit_offset = 0
	print("dialogue ended")
