extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var number_friends_visited = str(FriendHandler.num_visited_friend_stars)
	var total_number_of_friends = str(FriendHandler.friend_star_amount)
	text =  number_friends_visited + "/" + total_number_of_friends + " friends made"
