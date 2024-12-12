extends Area2D

const SPEED = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.x = global_position.x - delta * SPEED
	if(global_position.x <= -100):
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	get_parent().game_over()
