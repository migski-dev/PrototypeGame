extends Path2D

signal end_point_reached

@export var is_first : bool
var start_moving : bool
var finishedMoving : bool

const HEART = preload("res://scenes/components/heart.tscn")

func _ready():
	if(is_first):
		start_moving = true

func _process(delta):
	if(start_moving):
		$PathFollow2D.progress_ratio += delta / 5
		
	if($PathFollow2D.progress_ratio >= 1 and not finishedMoving):
		end_point_reached.emit()
		finishedMoving = true

func _on_player_path_end_point_reached():
	start_moving = true


	
