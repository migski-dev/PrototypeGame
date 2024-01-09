extends Area2D

@export var star_size: Array[String] =  ["Small", "Medium", "Large"]
@onready var sprite: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var size = get_random_size()
	set_sprite_scale(size)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_random_size():
	return star_size.pick_random()

func set_sprite_scale(sprite_size: String):
	if sprite_size == "Small":
		sprite.scale = Vector2(1,1)
		return
	elif  sprite_size == "Medium":
		sprite.scale = Vector2(2,2)
		return
	else:
		sprite.scale = Vector2(3,3)
		return
		
