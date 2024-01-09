extends Node2D

@onready var star_node = preload("res://scenes/game_object/star/star.tscn")
@onready var screenSize: Vector2 = get_viewport().get_visible_rect().size
@onready var screenSizeGrid: Dictionary
@export var tilemap: TileMap

var min_stars = 10
var max_stars = 20

func _ready():
	var spawn_locations = tilemap.get_used_cells_by_id(1)
	var star_count = randi_range(min_stars, max_stars)
	for n in range(star_count):
		create_star_in_random_position(spawn_locations)
	
func create_star_in_random_position(spawn_locations: Array[Vector2i]):
	var random_spawn_location = getSpawnLocation(spawn_locations)
	var converted_location = convert_grid_location_to_global(random_spawn_location)
	create_star(converted_location)

func convert_grid_location_to_global(position: Vector2i):
	return tilemap.map_to_local(position)

func create_star(pos: Vector2i):
	var new_star = star_node.instantiate()
	new_star.position = pos
	add_child(new_star)

func create_random_positions():
	var rng = RandomNumberGenerator.new()
	var randomX = rng.randi_range(0, screenSize.x)
	var randomY = rng.randi_range(0, screenSize.y)
	return Vector2(randomX, randomY)

func getSpawnLocation(spawnLocations: Array[Vector2i]):
	spawnLocations.shuffle()
	var location = spawnLocations.pop_front()
	return location
