extends Node

var friend_star_amount = 3;
var stars_visited: Array[Vector2] = []
var path_starts : Array[Vector2] = []
var path_ends : Array[Vector2] = []

var head: Vector2
var tail: Vector2

signal add_edge(start: Vector2, end: Vector2)

func _on_add_edge(start_pos: Vector2, end_pos: Vector2):
	add_edge.emit(start_pos, end_pos)
		
func add_star_position(pos: Vector2):
	stars_visited.push_back(pos)
	if(stars_visited.size() == 1):
		head = pos
	else:
		tail = head
		head = pos
		_on_add_edge(head, tail)
	
		
func get_stars_visited():
	return stars_visited

func reset():
	stars_visited = []
	path_starts = []
	path_ends = []

func return_array_of_lines():
	pass
