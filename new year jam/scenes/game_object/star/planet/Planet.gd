extends Node2D
class_name Planet
@onready var sprite_2d = $Sprite2D
var points : Array[Vector2]
@onready var line_2d = $Line2D

func _ready():
	randomize()
func set_orbit(orbit_size):
	var orbit = orbit_size / 2
	
	points.append(get_parent().global_position + (Vector2.RIGHT * orbit))
	points.append(get_parent().global_position + Vector2(0.5, 0.5) * orbit)
	points.append(get_parent().global_position + (Vector2.DOWN * orbit/2))
	points.append(get_parent().global_position + Vector2(-0.5, 0.5) * orbit)
	points.append(get_parent().global_position + ( Vector2.LEFT * orbit ))
	points.append(get_parent().global_position + Vector2(-0.5, -0.5) * orbit)
	points.append((get_parent().global_position + (Vector2.UP * orbit/2)))
	points.append(get_parent().global_position + Vector2(0.5, -0.5) * orbit)
	
	var rand_2 = randi_range(0, 7)
	
	for i in range(rand_2, rand_2+7):
		points.push_back(points.front())
		points.remove_at(0)
	
	var rand = randf_range(-PI, PI)
	
	for point in points:
		line_2d.add_point(point)
	
	line_2d.rotate(rand)
	
	
	
	sprite_2d.global_position = points[0]
	rotate_around_planet()

func rotate_around_planet():
	var tween = create_tween()
	tween.set_loops(0)
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.set_ease(Tween.EASE_IN_OUT)
	var rand = randi_range(0,7)
	var step = false
	for i in range(0, 7, 2):
		if not step:
			step = true
			tween.tween_property(sprite_2d, "global_position", line_2d.points[i], 1.0)
			if sprite_2d.z_index == 1:
				tween.tween_property(sprite_2d, "z_index", -1, 0.01)
			else:
					tween.tween_property(sprite_2d, "z_index", 1, 0.01)
			tween.tween_property(sprite_2d, "global_position", line_2d.points[i+1], 1.0)
			
		else:
			step = false
			tween.tween_property(sprite_2d, "global_position", line_2d.points[i], 0.5)
			if sprite_2d.z_index == 1:
				tween.tween_property(sprite_2d, "z_index", -1, 0.01)
			else:
					tween.tween_property(sprite_2d, "z_index", 1, 0.01)
			tween.tween_property(sprite_2d, "global_position", line_2d.points[i+1], 0.5)
			
	#tween.tween_property(sprite_2d, "global_position", line_2d.points[0], 0.5)
	#
	#tween.tween_property(sprite_2d, "global_position", line_2d.points[2], 1)
	#
	#tween.tween_property(sprite_2d, "global_position", line_2d.points[3], 1)
#
	#tween.tween_property(sprite_2d, "global_position", line_2d.points[4], 0.5)
	#tween.tween_property(sprite_2d, "global_position", line_2d.points[5], 0.5)
	#tween.tween_property(sprite_2d, "global_position", line_2d.points[6], 1.0)
	#tween.tween_property(sprite_2d, "z_index", -1, 0.01)
	#tween.tween_property(sprite_2d, "global_position", line_2d.points[7], 1.0)
	#tween.tween_property(sprite_2d, "global_position", points[0], 0.5)
	#tween.tween_property(sprite_2d, "global_position", points[0], 1)
	#tween.tween_property(sprite_2d, "global_position", points[1], 1)
	#tween.tween_property(sprite_2d, "global_position", points[2], 1)
	#tween.tween_property(sprite_2d, "global_position", points[3], 1)
