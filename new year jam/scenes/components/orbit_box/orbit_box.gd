extends Area2D

@export var presets : Array[PackedScene]
var collision : CollisionShape2D
func _ready():
	collision = get_child(0) #hardcoded bc always only 1 child
	
func set_orbit_size(size : int):
	collision.shape.radius = size
