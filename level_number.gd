extends Label

@onready var killCountNumber  = get_node("../KillCountLabel/KillCountNumber")
@onready var spawnTimer  = get_node("/root/Game/Timer")
var current_level = 0
var current_level_counter = 0

func check_level_up():
	if current_level_counter == 25:
		current_level += 1
		current_level_counter = 0
		self.text = str(current_level)
		spawnTimer.wait_time -= .25
	else:
		current_level_counter += 1
