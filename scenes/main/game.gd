extends Node2D

onready var gui = get_node("gui")

var point_player1 = 0
var point_player2 = 0

var nextBallDirection = Vector2(1,0)

func _ready():
	#set everything on the right place
	get_node("pad_player1").set_pos(Vector2(800,300))
	get_node("pad_player2").set_pos(Vector2(100,300))
	get_node("ball").set_pos(Vector2(450,300))

func goal(_player):
	if _player == 1:
		point_player2 += 1
		nextBallDirection = Vector2(-1,0)
		gui.set_points(2,point_player2)
	if _player == 2:
		point_player1 += 1
		nextBallDirection = Vector2(1,0)
		gui.set_points(1,point_player1)
	set_ball()

func set_ball():
	var _ballScene = load("res://scenes/ball/ball.tscn")
	var _ball = _ballScene.instance()
	_ball.set_pos(Vector2(450,300))
	_ball.direction = nextBallDirection #set variable on ball scene
	add_child(_ball)
	