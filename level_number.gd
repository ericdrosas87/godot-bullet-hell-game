extends Label

@onready var killCountNumber  = get_node("../KillCountLabel/KillCountNumber")
@onready var spawnTimer  = get_node("/root/Game/Timer")
@onready var levelUpMenu  = get_node("/root/Game/CanvasLayer/LevelUpMenu")
var current_level = 0
var current_level_counter = 0

func check_level_up():
	if current_level_counter == 5:
		# Level up stats and enemies
		current_level += 1
		current_level_counter = 0
		self.text = str(current_level)
		spawnTimer.wait_time -= .25
		
		# Then pause the game and show the level up menu
		get_tree().paused = true
		levelUpMenu.popup()
	else:
		current_level_counter += 1
