extends Sprite2D

@export var rotation_speed :float

func _ready():
	pass # Replace with function body.


func _process(delta):
	rotate(rotation_speed * delta)
