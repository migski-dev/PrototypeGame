extends Area2D

const FILE_BEGIN = "res://scenes/levels/level_"

@export var transition_manager : CanvasLayer
@export var transition_name = "fade_out"
@export var tilemap : TileMap
@export var constellation_ui : PackedScene
@export var wormhole_sfx: AudioStreamPlayer2D

func _on_body_entered(body):
	if body.is_in_group("player"):
		if(FriendHandler.check_level_finish()):
			wormhole_sfx.play(0)
			await get_tree().create_timer(.5).timeout
			var ui = constellation_ui.instantiate() as ConstellationUI
			get_tree().root.add_child(ui)
			ui.initialize_constellation_window(PathHandler.path_starts, PathHandler.path_ends, "Asdjd", PathHandler.stars_visited.size(), 239)
		else: 
			DialogueManager.show_dialogue_balloon(load("res://dialogue/wormhole_prompt.dialogue"), "start")
		
		# This block is for changing hard coded scene Levels 
		#var current_scene_file = get_tree().current_scene.scene_file_path
		#var next_level_number = current_scene_file.to_int() + 1
		#var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
		#print(next_level_path)
		#get_tree().change_scene_to_file(next_level_path)

