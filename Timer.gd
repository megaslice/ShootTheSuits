extends Timer

var Alien = preload("res://Alien.tscn")

func _on_Timer_timeout():
	if get_node("/root/Main/aliens").get_child_count()<(5 + 1 * Globals.get_level()):
		var alien = Alien.instance()
		alien.position.x = rand_range(0, 410)
		alien.position.y = rand_range(20, 80)
		get_node("/root/Main/aliens").add_child(alien)
		
