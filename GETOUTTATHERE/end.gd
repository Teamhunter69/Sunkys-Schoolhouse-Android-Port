extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.ESCAPE = false
	Escape.end = true
	$AnimationPlayer.play("end")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "end":
		Global.to_credits()
