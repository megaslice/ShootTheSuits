extends Area2D

var player = 0

func _process(delta):
	position.y -= delta * 100
