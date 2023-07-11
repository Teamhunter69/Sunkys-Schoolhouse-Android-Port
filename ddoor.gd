extends Spatial


func _ready():
	$StaticBody/CollisionShape.disabled = false
	

func _on_Area_area_entered(area: Area) -> void:
	if area.is_in_group("hit"):
		$AnimationPlayer.play("open")
	if area.is_in_group("int"):
		$AnimationPlayer.play("open")
