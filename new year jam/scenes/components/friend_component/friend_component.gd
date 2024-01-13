extends Node2D
class_name FriendComponent

func on_friend_orbit_entered(star):
	await get_tree().create_timer(1).timeout
	FriendHandler.on_visit_friend_star(star)
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/hello_world.dialogue"), "start")
