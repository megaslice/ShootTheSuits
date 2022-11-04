extends Timer

var Alien = preload("res://Alien.tscn")

func _on_Timer_timeout():
	if get_node("/root/Main/aliens").get_child_count()<10:
		var alien = Alien.instance()
		alien.position.x = rand_range(0, 410)
		alien.position.y = rand_range(20, 120)
		get_node("/root/Main/aliens").add_child(alien)
		
	get_node("/root/Main/Title").visible = true
	for i in range(4):	
		var s = get_node("/root/Main/Player"+str(i)).score
		if s>0:
			get_node("/root/Main/Title").visible = false
		

func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
