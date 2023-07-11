extends Node2D



func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("move_sprint"):
		$AnimationPlayer.playback_speed = 99999
		$Panel.visible = true

func _ready() -> void:
	$AnimationPlayer.play("doo")
	$Panel.visible = false

func _on_AnimationPlayer_animation_finished(_anim_name: String) -> void:
	Global.to_floor1()
