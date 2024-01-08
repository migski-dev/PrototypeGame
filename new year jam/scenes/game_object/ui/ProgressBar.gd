extends ProgressBar

@export var decrease_speed :float

signal on_movement_bar_empty

func _process(delta):
	value -= decrease_speed * delta
	if value <= 0:
		on_movement_bar_empty.emit()
