extends Spatial


func _ready() -> void:
	$AnimationPlayer.play("start")


func _on_Area_area_entered(area: Area) -> void:
	if area.is_in_group("hit"):
		$AnimationPlayer.play("bang")
