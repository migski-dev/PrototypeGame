extends Node

var friend_star_amount = 4
var friend_stars_visited: Array[Star] = []
var num_visited_friend_stars: int = 0

func on_visit_friend_star(star: Star):
	if !friend_stars_visited.has(star):
		friend_stars_visited.push_front(star)
		num_visited_friend_stars += 1
	

func set_friend_star_amount(amount: int):
	friend_star_amount = amount
	

func get_friend_star_amount(amount: int):
	return friend_star_amount


func reset_friends():
	friend_stars_visited = []
	num_visited_friend_stars = 0
