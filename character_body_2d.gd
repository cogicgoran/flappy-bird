extends CharacterBody2D

@onready var audio_player = $"../AudioStreamPlayer2D"
const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY
		audio_player.play()

	move_and_slide() 
	

func _on_bottom_area_body_entered(body: Node2D) -> void:
	get_parent().game_over()

func _on_top_area_body_entered(body: Node2D) -> void:
	get_parent().game_over()
