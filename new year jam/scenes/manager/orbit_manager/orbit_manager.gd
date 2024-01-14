extends Node
class_name OrbitManager

@export var player : Player
var stars
var star_to_orbit : Star
var move_player : bool = false
#var move_player_into_orbit : bool = false

const ORBIT_FOLLOW_ACCEL = 50

signal orbit_exited
# my wish is for this to control player orbit movement
@export var enter_orbit_sfx: AudioStreamPlayer2D
@export var exit_orbit_sfx: AudioStreamPlayer2D


func _ready():
	stars = get_tree().get_nodes_in_group("stars")
	player.entered_star_orbit.connect(on_player_enter_orbit)
	player.exiting_star_orbit.connect(on_player_request_orbit_exit)

func _physics_process(delta):
	if move_player:
		move_player_around_orbit(delta)

func on_player_enter_orbit(orbiting_star):
	star_to_orbit = orbiting_star
	
	#var tween = get_tree().create_tween()
	#tween.set_ease(Tween.EASE_OUT)
	#tween.tween_property(player, "velocity", Vector2.ZERO, 0.5)
	#tween.parallel().tween_property(player, "global_position", orbiting_star.orbit_point.global_position, 0.5)
	#await tween.finished
	move_player = true
	
	enter_orbit_sfx.play(0)

func move_player_around_orbit(delta):
	player.global_position = player.global_position.move_toward(star_to_orbit.orbit_point.global_position, ORBIT_FOLLOW_ACCEL * delta)

func on_player_request_orbit_exit():
	if(star_to_orbit == null):
		return
	move_player = false
	var direction = star_to_orbit.global_position.direction_to(player.global_position)
	var dir = star_to_orbit.orbit_point.global_position.direction_to(player.global_position)
	var target_position : Vector2 = player.global_position + dir *30
	
	player.velocity = direction*100 # a little impulse for a smooth transition
	exit_orbit_sfx.play(0)
	await get_tree().create_timer(0.5).timeout # hard coded for safetyd
	orbit_exited.emit()
