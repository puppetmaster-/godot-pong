
extends CanvasLayer

func _ready():
	pass

func set_points(_player,_new_points):
	get_node("CenterContainer/HBoxContainer/points_player"+str(_player)).set_text(str(_new_points))
