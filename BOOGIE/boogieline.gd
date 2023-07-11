extends Control



func _ready() -> void:
	pass # Replace with function body.

func _physics_process(_delta: float) -> void:
	if name == "line1":
		if Input.is_action_just_pressed("clin"):
			$AnimationPlayer.play("blip")
	if name == "line2":
		if Input.is_action_just_pressed("click2"):
			$AnimationPlayer.play("blip")
	
	if is_in_group("boogiething"):
		if self.visible == true:
			$Area2D/CollisionShape2D.disabled = false
		else:
			$Area2D/CollisionShape2D.disabled = true

func _on_Area2D_area_entered(area: Area2D) -> void:
	if area.is_in_group("boogieget"):
		self.visible = false
		Global.boogiescore = Global.boogiescore + 1
