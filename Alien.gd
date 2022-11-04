extends Area2D

var speed = 30

var Bomb = preload("res://Bomb.tscn")

func _process(delta):
	position.x += speed * delta
	if position.x > 410:
		speed = -speed
		position.x = 410
		position.y += 4
	if position.x < 0:
		speed = -speed
		position.x = 0
		position.y += 4
	if randf()<0.05:
		var bomb = Bomb.instance()
		bomb.position = position
		get_node("/root/Main/bombs").add_child(bomb)



func _on_Alien_area_entered(area):
	if 'player' in area:
		get_node("/root/Main/Player"+str(area.player)).score+=1
	queue_free()
