extends Node2D
@onready var animation_player = $AnimationPlayer


func trigger_talk_animation():
	animation_player.play("Talk")

func trigger_twinkle_animation():
	animation_player.play("Twinkle")
