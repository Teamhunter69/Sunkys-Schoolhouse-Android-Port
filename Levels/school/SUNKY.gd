extends Area



func _ready() -> void:
	pass
	
func _physics_process(_delta: float) -> void:
	if Global.score2 == 6:
		if Global.score == 0:
			$AnimationPlayer.play("lose")
		if Global.score > 0:
			$AnimationPlayer.play("win")
			

func _on_SUNKY2_area_entered(area: Area) -> void:
	if area.is_in_group("int"):
		$AnimationPlayer2.play("sqweek")
