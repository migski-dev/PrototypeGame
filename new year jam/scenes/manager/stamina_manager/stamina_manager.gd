extends Node

signal stamina_updated(currrent_stamina: float)

var current_stamina = 1

func _ready():
	var player = get_tree().get_first_node_in_group('player') 
	if(player == null):
		return
	player.player_move.connect(decrement_stamina)
	

func increment_stamina(number: float):
	current_stamina += number
	stamina_updated.emit(current_stamina)
	#print(current_stamina)
	

func decrement_stamina(number:float):
	current_stamina -= number
	stamina_updated.emit(current_stamina)
	#print(current_stamina)


func on_player_move(stamina_drain: float):
	decrement_stamina(stamina_drain)
