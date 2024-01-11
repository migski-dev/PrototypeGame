extends CanvasLayer

@export var animation_player : AnimationPlayer

func reload_scene_with_transition(transition_name):
	await play_transition(transition_name).animation_finished
	get_tree().reload_current_scene() 

func load_scene_with_transition(target_scene,transition_name):
	await play_transition(transition_name).animation_finished
	get_tree().change_scene_to_packed(target_scene)
	
func play_transition(transition_name):
	animation_player.play(transition_name)
	return animation_player
