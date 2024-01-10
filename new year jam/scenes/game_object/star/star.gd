extends Area2D
class_name Star

@export var star_size: Array[String] =  ["Small", "Medium", "Large"]
@onready var sprite: Sprite2D = $Sprite2D
@export var is_starting_star: bool

var orbit_size # for the orbit component

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var size =  "Medium" if is_starting_star else get_random_size()
	orbit_size = size
	set_sprite_scale(size)


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
