extends Star

func _ready():
	set_star_size_array()
	randomize()
	size = "Large"
	set_sprite_scale(size)
	
	orbit_size = convert_size_to_int(size)
	
	orbit_box.set_orbit_size(orbit_size)
	rotate_anchor.set_orbit_snap_distance(orbit_size)
	
	orbit_box.area_entered.connect(on_orbit_entered)
	orbit_box.area_exited.connect(on_orbit_exited)
	
	orbit_point = rotate_anchor.snap_point
	
func set_star_size_array():
	star_size = ["Large"]

func on_orbit_entered(area):
	var body = area.get_parent()
	rotate_anchor.snap_point_to_player_on_radius(body)
	rotate_anchor.orbit_speed_mod = orbit_size
	rotate_anchor.orbit_started = true
	rotate_anchor.rotation_dir = 1 if area.global_position.x > orbit_point.global_position.x else -1
	star_orbit_entered.emit(self)
	
	FriendHandler.on_visit_friend_star(self)
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/hello_world.dialogue"), "start")
	

func on_orbit_exited(area):
	rotate_anchor.orbit_started = false
