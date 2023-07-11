extends Spatial


func _ready() -> void:
	$AnimationPlayer.play("Spin")

signal ring

func _on_Area_body_entered(body: Node) -> void:
	if body.name == "Player":
		emit_signal("ring")
		Global.pdonut = Global.pdonut + 1
		$AnimationPlayer.play("Get")
		print("Ring!")

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "Get":
		#$AnimationPlayer.play("Spin")
		pass
