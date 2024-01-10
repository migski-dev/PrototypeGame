extends Area2D
class_name Star

@export var star_size: Array[String] =  ["Small", "Medium", "Large"]
@onready var sprite: Sprite2D = $Sprite2D
@onready var orbit_box = $OrbitBox
@onready var rotate_anchor = $RotateAnchor
var orbit_point

signal star_orbit_entered(star)

var orbit_size # for the orbit component

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var size = get_random_size()
	set_sprite_scale(size)
	
	var orbit_size = convert_size_to_int(size)
	
	orbit_box.set_orbit_size(orbit_size)
	rotate_anchor.set_orbit_snap_distance(orbit_size)
	
	orbit_box.area_entered.connect(on_orbit_entered)
	orbit_box.area_exited.connect(on_orbit_exited)
	
	orbit_point = rotate_anchor.snap_point

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_random_size():
	return star_size.pick_random()

func set_sprite_scale(sprite_size: String):
	match (sprite_size):
		"Small":
			sprite.scale = Vector2(1,1)
			return
		"Medium":
			sprite.scale = Vector2(2,2)
			return
		"Large":
			sprite.scale = Vector2(3,3)
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
	rotate_anchor.orbit_started = true
	star_orbit_entered.emit(self)

func on_orbit_exited(area):
	rotate_anchor.orbit_started = false
