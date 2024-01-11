extends StaticBody2D

@onready var rotation_range: float

# Called when the node enters the scene tree for the first time.
func _ready():
	rotation_range = randf_range(-.02, .02)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(rotation_range)
