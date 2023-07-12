extends Node2D



func _ready() -> void:
	Music.play0()
	$AnimationPlayer.play("play")
	$AudioStreamPlayer.play()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("move_sprint"):
		Global.to_floor1()
	if Input.is_action_just_pressed("fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen

func _on_HSlider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)

func _on_TextureButton_pressed() -> void:
	Global.to_warn()
