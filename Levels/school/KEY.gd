extends Sprite3D



func _ready() -> void:
	pass # Replace with function body.

func _on_Area_area_entered(area: Area) -> void:
	if name == "KEY":
		if area.is_in_group("int"):
			print("KEY!")
			self.visible = false
			$Area/CollisionShape.disabled = true
			Global.key = 1
			$AnimationPlayer.play("ding")
	if name == "LEMON":
		if area.is_in_group("int"):
			print("KEY!")
			self.visible = false
			$Area/CollisionShape.disabled = true
			Global.key = 2
			$AnimationPlayer.play("ding")

func _on_Area_body_entered(body: Node) -> void:
	if body.name == "Player":
		print("KEY!")
		self.visible = false
		$Area/CollisionShape.disabled = true
		if Global.key == 0:
			Global.key = 1
		else:
			Global.key = 2
		$AnimationPlayer.play("ding")
