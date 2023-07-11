extends Area


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer2.play("sqweek")

#func _process(delta: float) -> void:
#	pass

var don = false

func _on_SUNKY_area_entered(area: Area) -> void:
	if area.is_in_group("int"):
		$AnimationPlayer.play("sqweek")
		if don == false:
			don = true
			$AnimationPlayer2.play("sqwook")
