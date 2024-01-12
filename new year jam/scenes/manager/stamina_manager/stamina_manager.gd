extends Node

signal stamina_updated(currrent_stamina: float)
@onready var game_over = preload("res://scenes/game_over/game_over.tscn") as PackedScene

const STAMINA_REGEN = .005

var current_stamina = 1
var is_in_orbit = false

func _ready():
	var player = get_tree().get_first_node_in_group('player') 
	if(player == null):
		return
	player.player_move.connect(decrement_stamina)
	player.entered_star_orbit.connect(on_player_enter_orbit)
	player.exiting_star_orbit.connect(on_player_exit_orbit)

func _process(delta):
	# regens if orbiting
	if is_in_orbit:
		increment_stamina()
	
	
func increment_stamina():
	current_stamina = min(1, STAMINA_REGEN + current_stamina)
	stamina_updated.emit(current_stamina)
	#print(current_stamina)
	

func decrement_stamina(number:float):
	current_stamina -= number
	stamina_updated.emit(current_stamina)
	if current_stamina <= 0:
		get_tree().change_scene_to_packed(game_over)


func on_player_move(stamina_drain: float):
	decrement_stamina(stamina_drain)

func on_player_enter_orbit(star):
	is_in_orbit = true

func on_player_exit_orbit():
	is_in_orbit = false
