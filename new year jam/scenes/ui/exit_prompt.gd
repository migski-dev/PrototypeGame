extends CanvasLayer

@export var player : Player
@onready var animation_player = $AnimationPlayer
@onready var label = $MarginContainer/Label


var op : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	label.modulate.a = 0
	player.timer_value.connect(change_opacity)


func change_opacity():
	animation_player.play("fade_out")
	await animation_player.animation_finished
	animation_player.play_backwards("fade_out")
