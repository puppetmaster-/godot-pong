
extends CanvasLayer

onready var timer = get_node("CenterContainer/Timer")

var menuKeyBlocked = false
var paused = false

func _ready():
	timer.connect("timeout",self,"_timerTimeout")
	set_fixed_process(true)

func _fixed_process(delta):
	if !menuKeyBlocked:
		if Input.is_action_pressed("pause"):
			menuKeyBlocked = true
			timer.start()
			set_pause()

func _timerTimeout():
	menuKeyBlocked = false

func set_pause():
	if paused:
		get_tree().set_pause(false)
		paused = false
		get_node("CenterContainer").hide()
	else:
		get_tree().set_pause(true)
		paused = true
		get_node("CenterContainer").show()