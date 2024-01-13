extends CanvasLayer
class_name ConstellationUI

@onready var button = $MarginContainer/VBoxContainer/MarginContainer/Button
@onready var constellation_name_label = %ConstellationName
@onready var friends_made = %FriendsMade
@onready var line_2d = %Line2D

const resize_value = 10

func initialize_constellation_window(starts : Array[Vector2], ends : Array[Vector2], constellation_name : String, stars_visited : int, stars_total : int):
	constellation_name_label.text = constellation_name
	for i in range(starts.size()):
		line_2d.add_point(starts[i] / resize_value)
		line_2d.add_point(ends[i] / resize_value)
	friends_made.text = str(stars_visited) + " / " + str(stars_total) + " Stars Visited"
	var line_start = line_2d.points[0] as Vector2
	var line_end = line_2d.points[line_2d.get_point_count()-1] as Vector2
	var width = line_start.distance_to(line_end)
	var center = line_start.x + width/2
	var center_of_screen = Vector2(640/2, 360/2)
	line_2d.global_position.x = line_2d.global_position.x + Vector2(center, 360/2).distance_to(center_of_screen)
	line_2d.global_position.y = line_2d.global_position.y  + width



func _on_button_pressed():
	print("yeehaw")
