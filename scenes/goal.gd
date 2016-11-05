
extends Area2D

export(int, 1, 2) var player = 1

func _ready():
	#connect the area to a signal and call a function inside this script
	connect("body_enter",self,"_goal")


func _goal(_body):
	if _body.is_in_group("ball"):
		get_node("/root/game").goal(player)
		_body.free()
	