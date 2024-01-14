extends Node2D
@export var edge: PackedScene

func _ready():
	PathHandler.add_edge.connect(create_edge)

func create_edge(start: Vector2, end: Vector2):
	var new_edge = edge.instantiate()
	new_edge.add_point(start)
	PathHandler.path_starts.append(start)
	new_edge.add_point(end)
	PathHandler.path_ends.append(end)
	#new_edge.animation_player.play()
	new_edge.default_color = Color('#ffffff', .5)
	new_edge.play_animation()
	
	add_child(new_edge)
