class_name ConstellationEdge extends Line2D

var start : Vector2:
	get:
		return start
	set(value):
		start = value
		PathHandler.path_starts.append(value)
var end : Vector2:
	get:
		return start
	set(value):
		start = value
		PathHandler.path_ends.append(value)
