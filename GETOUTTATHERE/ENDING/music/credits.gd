extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("scroll")



func _process(delta: float) -> void:
	if Global.debug == true:
		if Input.is_action_pressed("move_sprint"):
			$AnimationPlayer.playback_speed = 10
		else:
			$AnimationPlayer.playback_speed = 1


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "scroll":
		$AnimationPlayer2.play("schooled")
		$AnimationPlayer.play("dance0")
	
	if anim_name == "dance0":
		$AnimationPlayer.play("dance1")
		$AnimationPlayer3.play("glow")
