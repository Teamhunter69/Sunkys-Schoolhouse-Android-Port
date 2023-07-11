extends Sprite3D

func _on_Area_area_entered(area: Area) -> void:
	if area.is_in_group("int"):
		Global.select = 1
		Global.punch = true

var stahp = false

func _physics_process(_delta: float) -> void:
	if Global.knuxdone == true:
		if stahp == false:
			$nopass.visible = false
			$nopass/StaticBody/CollisionShape.disabled = true
			stahp = true
