extends Panel

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(self.visible && Input.is_key_pressed(KEY_R)):
		get_tree().paused = false
		self.hide()
		get_tree().reload_current_scene()
