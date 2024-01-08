extends AudioStreamPlayer

# label is needed to know when text is being typed
@export var label : DialogueLabel
@export var timer : Timer
@export var timer_avg : float
@export_range(0, 0.5) var timer_variation : float

# timer is for delay between noises

func _ready():
	timer.timeout.connect(on_timeout)
	timer.start()


func on_timeout():
	if label.is_typing == true:
		var rand = randf_range(0.7, 1.2)
		rand = snappedf(rand, 0.05)
		play()
		timer.start(randf_range(timer_avg - timer_variation, timer_avg + timer_variation))
	else:
		timer.start()
