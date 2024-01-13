extends CharacterBody2D
class_name Player

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree["parameters/playback"]
@onready var sprite_2d = $SpriteTilt/Sprite2D
@onready var sprite_tilt = $SpriteTilt
@onready var cpu_particles_2d = $CPUParticles2D # the trail


@onready var exit_timer = $OrbitExitTimer
@export var orbit_manager : OrbitManager

const MAX_SPEED = 200
const ACCEL_SMOOTHING = 3
const STAMINA_DRAIN = 0.00075


var movement_allowed = true
var orbiting_star : Star
var is_orbiting = false
var tween

# Custom Signal to emit to stamina manager
signal player_move(stamina_drain: float)

# custom signal to orbit_manager to control the player's
# position while in orbit
signal entered_star_orbit(star : Star)

# custom signal to request exit from star orbit
# takes no arguments since star should be the last star landed on
signal exiting_star_orbit

signal timer_value() # for the UI


func _ready():
	exit_timer.timeout.connect(on_exit_timer_timeout)
	orbit_manager.orbit_exited.connect(on_orbit_exited)

func on_exit_timer_timeout():
	exiting_star_orbit.emit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_orbiting:
		if Input.is_action_just_pressed("space"):
			timer_value.emit()
			exit_timer.start()
		
		if Input.is_action_just_released("space"):
			exit_timer.stop()
	
	var dir: Vector2 = get_movement_vector()
	
	if not is_orbiting:
		if dir:
			state_machine.travel("Flying")
		else:
			state_machine.travel("Idle")
	else:
		state_machine.travel("Idle")
	if dir:
		cpu_particles_2d.emitting = true
		if dir.x < 0:
			sprite_2d.flip_h = true
			cpu_particles_2d.direction = Vector2(1.0, 0.0)
		else:
			sprite_2d.flip_h = false
			cpu_particles_2d.direction = Vector2(-1.0, 0.0)
	else:
		cpu_particles_2d.emitting = false
		
	if is_orbiting:
		cpu_particles_2d.emitting = true
		cpu_particles_2d.direction = global_position.direction_to(orbiting_star.global_position).rotated(PI/2)
	#var max_angle = PI/2
	#var min_angle = PI/2
	#
	#sprite_tilt.rotation = dir.angle() if sprite_2d.flip_h else -dir.angle()
	
	var target_velocity = dir * MAX_SPEED
	
	velocity = velocity.lerp(target_velocity, 1 - exp(-delta * ACCEL_SMOOTHING))
	
	move_and_slide()
	
	# If player input vector is non-zero, emit the player_move signal
	if(dir != Vector2.ZERO):
		emit_player_move()
	
	

func get_movement_vector(): 
	var movement_dir: Vector2 
	if movement_allowed:
		movement_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	return movement_dir
	
	
func emit_player_move():
	player_move.emit(STAMINA_DRAIN)


func _on_orbit_detection_area_entered(area):
	is_orbiting = true
	movement_allowed = false
	
	orbiting_star = area.get_parent()
		
	await orbiting_star.star_orbit_entered
	entered_star_orbit.emit(orbiting_star)
	
	PathHandler.add_star_position(orbiting_star.position)

func on_orbit_exited():
	movement_allowed = true
	is_orbiting = false
