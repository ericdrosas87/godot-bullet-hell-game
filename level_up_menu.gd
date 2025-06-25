extends PopupMenu

@onready var gunObj = get_node("/root/Game/Player/Gun")
@onready var healthBar = get_node("/root/Game/Player/ProgressBar")
# Gun

func _on_id_pressed(id: int) -> void:
	match id:
		1: # bullet
			gunObj.bulletCount = gunObj.bulletCount + 1
			print("Extra bullet selected!")
			self.hide()
			get_tree().paused = false
		2: # health
			healthBar.max_value += 15
			print("Extra health selected! New max health:")
			print(healthBar.max_value)
			self.hide()
			get_tree().paused = false
		3: # star
			print("Star of Protection selected!")
