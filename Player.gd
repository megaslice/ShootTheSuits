extends Node2D

var Bullet = preload("res://Bullet.tscn")

export var PLAYER = 0
export (String, MULTILINE) var TEXT = ""
export (Color) var COLOR

var shoot_timer = 0

var score = 0

var alive = true

func _enter_tree():
	$sprite.position.y = 200
	$sprite.position.x = 60+PLAYER*100
	$score.margin_left = PLAYER*100
	$sprite/title.set_text(TEXT)
	$sprite.modulate = COLOR
	$sprite/title.modulate = COLOR
	$score.modulate = COLOR

func _process(delta):
	
	shoot_timer += delta
	var s = "%02d" % score
	$score.text = s
	$sprite/title.visible = Globals.show_title
	if alive:
		visible = true
		if Input.get_joy_axis(PLAYER,0) < -0.1:
			$sprite.position.x += delta * 100 * Input.get_joy_axis(PLAYER,0)
		if Input.get_joy_axis(PLAYER,0) > 0.1:
			$sprite.position.x += delta * 100 * Input.get_joy_axis(PLAYER,0)
		if (Input.is_joy_button_pressed(PLAYER, 0) or Input.is_key_pressed(KEY_SPACE)) and shoot_timer>0.1  and $bullets.get_child_count()< (Globals.get_level()/4 + 2):
			$fire.play()
			var bullet = Bullet.instance()
			bullet.position = $sprite.position
			bullet.position.y -= 20
			bullet.modulate = COLOR
			$bullets.add_child(bullet)
			shoot_timer=0
		if Input.is_key_pressed(KEY_LEFT) or Input.is_joy_button_pressed(PLAYER, JOY_DPAD_LEFT):
			$sprite.position.x -= delta * 100
		elif Input.is_key_pressed(KEY_RIGHT) or Input.is_joy_button_pressed(PLAYER, JOY_DPAD_RIGHT):
			$sprite.position.x += delta * 100 
	else:
		visible = false
		if (Input.is_joy_button_pressed(PLAYER, 0) or Input.is_key_pressed(KEY_SPACE)): # and shoot_timer>1 and $bullets.get_child_count()<3:
			$spawn.play()
			alive = true
			score = 0
	$sprite.position.x = clamp($sprite.position.x, 10, 410)


func _on_sprite_area_entered(area):
	if score > 1 and alive:
		alive = false
		$sprite.position.x = 60+PLAYER*100
		score = 0
		$die.play()
