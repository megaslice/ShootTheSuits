extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var show_title = true
var total_score = 0
var high_score = 50

func get_level():
	return (total_score/10)+1
	if total_score < 10:
		return 1
	elif total_score < 20:
		return 2
	elif total_score < 40:
		return 3
	return 3
