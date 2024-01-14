extends Node

var level = 0
var constellation_array = ["leo", "scorpio", "virgo"]
var constellation = constellation_array[level]

var friend_star_amount = 1
var friend_stars_visited: Array[FriendStar] = []
var num_visited_friend_stars: int = 0

var star_amount = 0


func on_visit_friend_star(star: FriendStar):
	if !friend_stars_visited.has(star):
		friend_stars_visited.push_back(star)
		num_visited_friend_stars += 1
	return friend_stars_visited.find(star);


func reset_friends():
	friend_stars_visited = []
	num_visited_friend_stars = 0
	level += 1
	constellation = constellation_array[level]
	star_amount = 0
	

func game_over():
	friend_stars_visited = []
	num_visited_friend_stars = 0
	level = 0
	constellation = constellation_array[level]
	star_amount = 0
	
	
func get_level():
	return level
	
	
func set_friend_star_amount(num: int):
	friend_star_amount = num

func check_level_finish():
	return friend_stars_visited.size() == friend_star_amount
		
		
func incr_star_amount():
	star_amount += 1
