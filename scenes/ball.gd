
extends KinematicBody2D

var velocity = 300
var direction = Vector2(1,0)
var canMove = false

func _ready():
	get_node("startTimer").connect("timeout",self,"_startTimerTimeout") #wait on start
	get_node("speedTimer").connect("timeout",self,"_increaseSpeed") #increase ball speed
	set_fixed_process(true)

func _fixed_process(delta):
	if canMove:
		if is_colliding():
			if get_collider().is_in_group("wall"):
				direction = Vector2(direction.x,direction.y*-1)
			if get_collider().is_in_group("player"):
				var _diff = get_collider().get_pos().y-get_collision_pos().y
				direction = Vector2(direction.x*-1,_diff/70*-1)
		move(direction*velocity*delta)

func _startTimerTimeout():
	get_node("speedTimer").start()
	canMove = true

func _increaseSpeed():
	velocity += 2