extends Area2D


@export var transition_manager : CanvasLayer
@export var transition_name = "fade_out"

@export var main_menu : PackedScene = preload("res://main_menu.tscn")

func _on_body_entered(body):
	# Chillen this is the next level button logic
	if body.is_in_group("player"):
		var level = 4 + FriendHandler.get_level()
		if(level == 6):
			transition_manager.load_scene_with_transition(main_menu, transition_name)
		else:	
			PathHandler.reset()
			FriendHandler.reset_friends()
			transition_manager.reload_scene_with_transition(transition_name) 
		# This block is for changing hard coded scene Levels 
		#var current_scene_file = get_tree().current_scene.scene_file_path
		#var next_level_number = current_scene_file.to_int() + 1
		#var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
		#print(next_level_path)
		#get_tree().change_scene_to_file(next_level_path)
