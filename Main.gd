extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$score.modulate = Color(randf(), randf(), randf())
	var x = "%03d" % Globals.total_score
	$score.text = x
	
	$Title/highscore.modulate = Color(randf(), randf(), randf())
	var h = "%04d" % Globals.high_score
	$Title/highscore.text = h

	get_node("/root/Main/Title").visible = true

	Globals.total_score = 0
	for i in range(4):	
		var s = get_node("/root/Main/Player"+str(i)).score
		Globals.total_score += s
		Globals.high_score = max(Globals.high_score, Globals.total_score)
	if Globals.total_score>4:
		Globals.show_title = false
	else:
		Globals.show_title = true

	get_node("/root/Main/Title").visible = Globals.show_title
		

func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
