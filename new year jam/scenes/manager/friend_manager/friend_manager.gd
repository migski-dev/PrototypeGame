extends Node2D

@onready var friend_node = preload("res://scenes/game_object/friend_star/friend_star.tscn")
@onready var screenSize: Vector2 = get_viewport().get_visible_rect().size
@onready var screenSizeGrid: Dictionary
@export var tilemap: TileMap
#
func _ready():
	# Designated TileMap layer generation
	var level = 4 + FriendHandler.get_level()
	#var level = 6 + FriendHandler.get_level()

	var spawn_locations = tilemap.get_used_cells_by_id(level)
	FriendHandler.set_friend_star_amount(spawn_locations.size())
	for location in spawn_locations:
		var converted_location = convert_grid_location_to_global(location)
		create_friend(converted_location)

func convert_grid_location_to_global(position: Vector2i):
	return tilemap.map_to_local(position)

func create_friend(pos: Vector2i):
	# turned off friends for debugging sprites
	var new_friend = friend_node.instantiate()
	new_friend.position = pos
	add_child(new_friend)
	pass
