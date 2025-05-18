extends Area2D

@onready var levelNumber  = get_node("/root/Game/CanvasLayer/LevelLabel/LevelNumber")

func _physics_process(delta: float) -> void:
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		#look_at(target_enemy.global_position)
		var mouse_position = get_global_mouse_position()
		look_at(mouse_position)
		
		var direction = Vector2.RIGHT.rotated(rotation)
		var lookingRight = true
		if direction[0] < 0:
			if self.scale.y > 0:
				self.scale.y *= -1;
		else:
			if self.scale.y < 0:
				self.scale.y *= -1;
		
func shoot():
	for i in levelNumber.current_level + 1:
		const BULLET = preload("res://bullet.tscn")
		var new_bullet = BULLET.instantiate()
		var variance = 0
		if i > 0:
			variance = randf_range(-1.0, 1.0)
			
		new_bullet.global_position = %ShootingPoint.global_position
		new_bullet.global_rotation = %ShootingPoint.global_rotation + variance
		%ShootingPoint.add_child(new_bullet)
	
	#var new_bullet2 = BULLET.instantiate()
	#
	#new_bullet2.global_position = %ShootingPoint.global_position
	#new_bullet2.global_rotation = %ShootingPoint.global_rotation + .25
	#%ShootingPoint.add_child(new_bullet2)

func _on_timer_timeout() -> void:
	shoot()
