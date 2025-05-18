extends Label

@onready var levelNumber  = get_node("../../LevelLabel/LevelNumber")
var killCount = 0

func update_kill_count():
	self.text = str(killCount)
	levelNumber.check_level_up()
