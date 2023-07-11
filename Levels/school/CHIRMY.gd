extends Sprite3D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass



func _on_Area_area_entered(area: Area) -> void:
	if area.is_in_group("int"):
		if Global.key == 2:
			$AnimationPlayer.play("open")
			

func _on_Area_body_entered(body: Node) -> void:
	if body.name == "Player":
		$AnimationPlayer.play("espyo")
