extends Area2D

var speed = 30

var Bomb = preload("res://Bomb.tscn")

var shoot_timeout = 0


func _process(delta):
	shoot_timeout -= delta

	
	position.x += speed * Globals.get_level() * delta
	if position.x > 410:
		speed = -speed
		position.x = 410
		position.y += 7
	if position.x < 0:
		speed = -speed
		position.x = 0
		position.y += 7
	if shoot_timeout <= 0 and visible == true:
		var bomb = Bomb.instance()
		bomb.position = position
		get_node("/root/Main/bombs").add_child(bomb)
		shoot_timeout = randf()*7



func _on_Alien_area_entered(area):
	if 'player' in area:
		get_node("/root/Main/Player"+str(area.player)).score+=1
	$die.play()	
	visible = false
	yield(get_tree().create_timer(1.0), "timeout")
	queue_free()
