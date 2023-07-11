extends Spatial



func _ready() -> void:
	$dummy.visible = true

func _on_Area_body_entered(body: Node) -> void:
	if body.name == "Player":
		$dummy.visible = true

func _on_Area_body_exited(body: Node) -> void:
	if body.name == "Player":
		$dummy.visible = false
