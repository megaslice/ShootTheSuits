extends Area2D

var Bullet = preload("res://Bullet.tscn")

export var PLAYER = 0

var shoot_timer = 0

var score = 0

var alive = true

func _process(delta):
	
	shoot_timer += delta
	var s = "%02d" % score
	get_node("/root/Main/HUD/score"+str(PLAYER)).text = s
	if alive:
		visible = true
		if Input.get_joy_axis(PLAYER,0) < -0.1:
			position.x += delta * 100 * Input.get_joy_axis(PLAYER,0)
		if Input.get_joy_axis(PLAYER,0) > 0.1:
			position.x += delta * 100 * Input.get_joy_axis(PLAYER,0)
		if (Input.is_joy_button_pressed(PLAYER, 0) or Input.is_key_pressed(KEY_SPACE)) and shoot_timer>1: #and get_node("/root/Main/bullets"+str(PLAYER)).get_child_count()<3:
			$fire.play()
			var bullet = Bullet.instance()
			bullet.position = position
			bullet.modulate = modulate
			get_node("/root/Main/bullets"+str(PLAYER)).add_child(bullet)
			shoot_timer=0
		if Input.is_key_pressed(KEY_LEFT):
			position.x -= delta * 100
		elif Input.is_key_pressed(KEY_RIGHT):
			position.x += delta * 100 
	else:
		visible = false
		if (Input.is_joy_button_pressed(PLAYER, 0) or Input.is_key_pressed(KEY_SPACE)) and shoot_timer>1: #and get_node("/root/Main/bullets"+str(PLAYER)).get_child_count()<3:
			$spawn.play()
			alive = true
			score = 0
	position.x = clamp(position.x, 10, 410)


func _on_Player_area_entered(area):
	alive = false
	$die.play()
