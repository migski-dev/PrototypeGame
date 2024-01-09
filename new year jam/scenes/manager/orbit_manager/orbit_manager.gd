extends Node

const ORBIT_BOX = preload("res://scenes/components/orbit_box/orbit_box.tscn")
@export var collision_shapes : Array[PackedScene]
var stars

func _ready():
	assign_orbits_to_stars()

func assign_orbits_to_stars():
	stars = get_tree().get_nodes_in_group("stars")

	for star in stars:
		var orbit = ORBIT_BOX.instantiate()
		var star_shape = star.orbit_size
		star.add_child(orbit)
		
		var col
		
		match star_shape:
			"Small":
				col = collision_shapes[0].instantiate()
				orbit.add_child(col)
			"Medium":
				col = collision_shapes[1].instantiate()
				orbit.add_child(col)
			"Large":
				col = collision_shapes[2].instantiate()
				orbit.add_child(col)
		
		
		
