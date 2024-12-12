extends Node2D
@onready var audio_player = $AudioStreamPlayer2D
var barrier_top_scene: PackedScene = preload("res://top_barrier.tscn")
var barrier_bottom_scene: PackedScene = preload("res://bottom_barrier.tscn")
var point_area_scene: PackedScene = preload("res://area_exit_point.tscn")
var game_over_sound = preload("res://game_over.mp3")
var passed = 0
var points = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	passed += delta
	if(passed >= 1):
		passed = 0
		createBarrier()

func createBarrier() -> void:
	var instance_top = barrier_top_scene.instantiate()
	var instance_bottom = barrier_bottom_scene.instantiate()
	var instance_point_area = point_area_scene.instantiate()
	add_child(instance_top)
	add_child(instance_bottom)
	add_child(instance_point_area)
	# TODO: Remember previous rand and set max diff between adjacent barriers
	# Currently there is a possibility where player can't pass barrier if diff is too great
	var rand_y = randf() * 400 - 225 
	instance_top.position = Vector2(1200, rand_y)
	instance_bottom.position = Vector2(1200, rand_y + 700)
	instance_point_area.position = Vector2(1230,0)

func game_over() -> void:
	audio_player.stop()
	audio_player.stream = game_over_sound
	audio_player.play()
	get_tree().paused = true
	$GameOverPanel/HighScoreLabel.text = "Current score: %s\nHigh score:%s" % [str(points),str(GameData.high_score)]
	if(points > GameData.high_score):  GameData.high_score = points
	$GameOverPanel.show()

func on_barrier_passed() -> void:
	points += 1
	$Panel/Label.text = "Points: " + str(points)
