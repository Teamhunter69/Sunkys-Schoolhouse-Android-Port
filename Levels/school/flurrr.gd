extends Spatial

var bat = false

var bat2 = false

func _ready() -> void:
	if name == "flur":
		$victor.frame = 0

func _process(_delta: float) -> void:
	if $Panel.visible == true:
		Global.hud2 = false
	else:
		Global.hud2 = true
	
	if $Panel2.visible == true:
		if bat2 == false:
			$victor/AnimationPlayer.play("hit")
			bat2 = true

func _on_Area_area_entered(area: Area) -> void:
	if area.is_in_group("hit"):
		$victor/AnimationPlayer.play("hit2")
