extends Node2D
@onready var snap_point : Node2D = $SnapPoint

var orbit_started : bool = false

var orbit_speed_mod

var rotation_dir : int = 1 # can either be 1 or -1

func _process(delta):
	if orbit_started:
		if get_parent().orbit_size == 90:
			print("large")
			rotate(0.1 * rotation_dir * delta)
		else:
			rotate(1 * rotation_dir *delta)
	

func set_orbit_snap_distance(size):
	snap_point.position = Vector2(size, 0.0)

func snap_point_to_player_on_radius(player):
	look_at(player.global_position)
