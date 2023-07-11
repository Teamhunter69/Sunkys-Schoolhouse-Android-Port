extends Area


func _ready() -> void:
	pass



func _on_Area_body_entered(body: Node) -> void:
	if body.name == "Player":
		Global.punch = true
