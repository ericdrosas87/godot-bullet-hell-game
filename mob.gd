extends CharacterBody2D

@onready var player  = get_node("/root/Game/Player")
@onready var killCountNumber  = get_node("/root/Game/CanvasLayer/KillCountLabel/KillCountNumber")

var health = 3

func _ready() -> void:
	%Slime.play_walk()

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()

func take_damage():
	health -= 1
	%Slime.play_hurt()
	
	if health == 0:
		queue_free()
		
		# destroy objcet
		const SMOKE_SCREEN = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCREEN.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
		
		# update kill count
		killCountNumber.killCount += 1
		killCountNumber.update_kill_count()
