extends Area2D
class_name Star
#@onready var planet = $Planet

@export var star_size: Array[String] =  ["Small", "Medium", "Large"]
@onready var sprite: Sprite2D = $Sprite2D
@onready var orbit_box = $OrbitBox
@onready var rotate_anchor = $RotateAnchor

@export var mid_star_array : Array[PackedScene]
@export var mini_star_array : Array[PackedScene]
@export var big_star_array : Array[PackedScene]

var orbit_point
var size

signal star_orbit_entered(star)

var orbit_size # for the orbit component

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	size = get_random_size()
	set_sprite_scale(size)
	
	orbit_size = convert_size_to_int(size)
	
	orbit_box.set_orbit_size(orbit_size)
	rotate_anchor.set_orbit_snap_distance(orbit_size)
	
	orbit_box.area_entered.connect(on_orbit_entered)
	orbit_box.area_exited.connect(on_orbit_exited)
	
	orbit_point = rotate_anchor.snap_point
	

	
	#if planet:
		#planet.set_orbit(orbit_size)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_random_size():
	return star_size.pick_random()

func set_sprite_scale(sprite_size: String):
	match (sprite_size):
		"Small":
			var pick = mini_star_array.pick_random().instantiate()
			add_child(pick)
			(pick as StarVisual).trigger_twinkle_animation()
			return
		"Medium":
			var pick = mid_star_array.pick_random().instantiate()
			add_child(pick)
			(pick as StarVisual).trigger_twinkle_animation()
			return
		"Large":
			var pick = big_star_array.pick_random().instantiate()
			add_child(pick)
			(pick as StarVisual).trigger_twinkle_animation()
			return

func convert_size_to_int(size):
	match size:
		"Small":
			return 30
		"Medium":
			return 45
		"Large":
			return 90

func on_orbit_entered(area):
	var body = area.get_parent()
	rotate_anchor.snap_point_to_player_on_radius(body)
	rotate_anchor.orbit_speed_mod = orbit_size
	rotate_anchor.orbit_started = true
	rotate_anchor.rotation_dir = 1 if area.global_position.x > orbit_point.global_position.x else -1
	star_orbit_entered.emit(self)
		

func on_orbit_exited(area):
	rotate_anchor.orbit_started = false
