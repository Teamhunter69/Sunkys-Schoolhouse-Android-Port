extends Spatial


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


var A = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("9"):
		Global.key = 1
		

func _on_Area_area_entered(area: Area) -> void:
	if area.is_in_group("int"):
		if Global.key == 1:
			$LASER/StaticBody/CollisionShape.disabled = true
			$LASER.visible = false
			$LASERKEY/Area/CollisionShape.disabled = true
			Global.key = 0
			if A == false:
				$LASERKEY/AnimationPlayer.play("beep")
				A = true
