extends Node2D

@onready var star_node = preload("res://scenes/game_object/star/star.tscn")

var min_stars = 3
var max_stars = 10
#var screenSize = get_viewport().get_visible_rect().size

#func _ready():
	#var star_count = randi_range(min_stars, max_stars)
	#for n in range(star_count):
		#create_star_in_random_position()

func _physics_process(delta):
	if Input.is_action_just_pressed("mouse_click"):
		create_star(get_global_mouse_position())

#func create_star_in_random_position():
	#var random_position = create_random_positions()
	#create_star(random_position)

func create_star(pos: Vector2):
	var new_star = star_node.instantiate()
	new_star.position = pos
	add_child(new_star)

#func create_random_positions():
	#var rng = RandomNumberGenerator.new()
	#var randomX = rng.randi_range(0, screenSize.x)
	#var randomY = rng.randi_range(0, screenSize.y)
	#return Vector2(randomX, randomY)
