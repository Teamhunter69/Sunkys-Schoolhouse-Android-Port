extends Spatial

func _on_Area_area_entered(area: Area) -> void:
	if area.is_in_group("hit"):
		Global.emeralds = Global.emeralds + 1
		queue_free()
