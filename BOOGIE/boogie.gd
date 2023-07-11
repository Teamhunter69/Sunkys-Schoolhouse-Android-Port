extends Spatial

var ding = false

func _on_Area_body_entered(_body: Node) -> void:
	pass
	#if body.name == "Player":
	#	$CAM/AnimationPlayer.play("cam")
	#	Global.hud = false

func _physics_process(_delta: float) -> void:
	if Global.boogie == true:
		self.visible = true
		$CAM/AnimationPlayer.play("cam")
		Global.hud = false
		$Control.visible = true
	else:
		Global.hud = true
		$Control.visible = false
		self.visible = false
	#if Input.is_action_just_pressed("E"):
	#	if ding == false:
	#		Global.boogie = true
	#		ding = true
	#	elif ding == true:
	#		Global.boogie = false
	#		ding = false
	
	if Global.boogiescore < 30:
		$Sprite3D2.frame = 0
	elif Global.boogiescore > 29:
		$Sprite3D2.frame = 4
	
	#print("B", Global.boogie)
	#print("C", ding)


func _on_AnimationPlayer_animation_finished(_anim_name: String) -> void:
	Global.boogie = false
	Global.control = true
	Global.tlelsdone = true
	Music.play2()
