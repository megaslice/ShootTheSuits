extends Area2D

var player = 0

func _process(delta):
	position.y -= delta * (80 + Globals.get_level()*20)
	if position.y < 0:
		queue_free()
