extends CharacterBody2D

signal health_depleted

var health = 100.0

#@onready var grass_shader := $TextureRect.material as ShaderMaterial
@onready var grass_shader := get_node("../CanvasLayer/GrassTile").material as ShaderMaterial

func _physics_process(delta: float) -> void:
	var cam_pos = get_viewport().get_camera_2d().global_position
	grass_shader.set_shader_parameter("scroll_offset", cam_pos)
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	
	if velocity.length() > 0.0:
		$HappyBoo.play_walk_animation()
	else:
		$HappyBoo.play_idle_animation()

	const DAMAGE_RATE = 5.0
	var overlapping_mobs = $HurtBox.get_overlapping_bodies()
	
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		$ProgressBar.value = health
		#if health < 0:
			#health_depleted.emit()
