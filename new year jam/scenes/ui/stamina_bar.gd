extends CanvasLayer

@export var stamina_manager: Node
@onready var progress_bar = $MarginContainer/ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	progress_bar.value = 1
	stamina_manager.stamina_updated.connect(on_stamina_updated)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_stamina_updated(current_stamina: float):
	var percent = current_stamina
	progress_bar.value = percent
