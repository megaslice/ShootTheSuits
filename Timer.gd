extends Timer

var Alien = preload("res://Alien.tscn")

func _on_Timer_timeout():
	if get_node("/root/Main/aliens").get_child_count()<10:
		var alien = Alien.instance()
		alien.position.x = rand_range(0, 410)
		alien.position.y = rand_range(20, 120)
		get_node("/root/Main/aliens").add_child(alien)

func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
