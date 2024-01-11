extends Node2D

@onready var asteroid_node = preload("res://scenes/game_object/asteroid/asteroid.tscn")
@onready var screenSize: Vector2 = get_viewport().get_visible_rect().size
@onready var screenSizeGrid: Dictionary
@export var tilemap: TileMap

func _ready():
	var spawn_locations = tilemap.get_used_cells_by_id(2)
	for location in spawn_locations:
		var converted_location = convert_grid_location_to_global(location)
		create_asteroid(converted_location)

func convert_grid_location_to_global(position: Vector2i):
	return tilemap.map_to_local(position)

func create_asteroid(pos: Vector2i):
	var new_star = asteroid_node.instantiate()
	new_star.position = pos
	add_child(new_star)
