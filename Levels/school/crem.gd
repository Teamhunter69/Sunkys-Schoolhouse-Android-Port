extends Spatial



func _ready() -> void:
	$Sprite3D.texture = load("res://OFFICE/CLASSES/crem/crem1.png")

func _on_Area_body_entered(body: Node) -> void:
	if body.name == "Player":
		$Sprite3D.texture = load("res://OFFICE/CLASSES/crem/crem2.png")
