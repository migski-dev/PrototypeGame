extends CharacterBody2D
class_name Player

const MAX_SPEED = 200
const ACCEL_SMOOTHING = 3
const STAMINA_DRAIN = 0.00075

# Custom Signal to emit to stamina manager
signal player_move(stamina_drain: float)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dir: Vector2 = get_movement_vector()
	var target_velocity = dir * MAX_SPEED
	
	velocity = velocity.lerp(target_velocity, 1 - exp(-delta * ACCEL_SMOOTHING))
	move_and_slide()
	
	# If player input vector is non-zero, emit the player_move signal
	if(dir != Vector2.ZERO):
		emit_player_move()
	

func get_movement_vector(): 
	var movement_dir: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	return movement_dir
	
	
func emit_player_move():
	player_move.emit(STAMINA_DRAIN)
