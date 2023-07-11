extends Sprite3D



func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func _on_AnimationPlayer_animation_finished(_anim_name: String) -> void:
	pass # Replace with function body.

func _on_Area_area_entered(area: Area) -> void:
	if area.is_in_group("hit"):
		$AnimationPlayer.play("swing")
		$Area/CollisionShape.disabled = true
		$StaticBody/CollisionShape.disabled = true
