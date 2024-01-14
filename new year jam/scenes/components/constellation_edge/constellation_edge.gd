class_name ConstellationEdge extends Line2D
@export var animation_player: AnimationPlayer


var start : Vector2:
	get:
		return start
	set(value):
		start = value
		PathHandler.path_starts.append(value)
var end : Vector2:
	get:
		return start
	set(value):
		start = value
		PathHandler.path_ends.append(value)
		#
#func _ready():
	#animation_player.play("fade_edge")
func play_animation():
	animation_player.play("fade_edge")
