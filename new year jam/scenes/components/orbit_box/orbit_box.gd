extends Area2D

@export var presets : Array[PackedScene]
var collision : CollisionShape2D
var arc_size
func _ready():
	collision = get_child(0) #hardcoded bc always only 1 child
	
func set_orbit_size(size : int):
	collision.shape.radius = size
	arc_size = size

func _draw():
	draw_arc(Vector2(0, 0), arc_size, 0, TAU, 50, Color(Color.WHITE, 0.2))
