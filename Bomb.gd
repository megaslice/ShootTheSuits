extends Area2D

func _process(delta):
	position.y += delta * (80 + Globals.get_level()*10)
