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
		if Input.is_joy_button_pressed(PLAYER, 0) and shoot_timer>1: #and get_node("/root/Main/bullets"+str(PLAYER)).get_child_count()<3:
			var bullet = Bullet.instance()
			bullet.position = position
			get_node("/root/Main/bullets"+str(PLAYER)).add_child(bullet)
			shoot_timer=0
	else:
		visible = false


func _on_Player_area_entered(area):
	alive = false
