extends Control

func _ready() -> void:
	pass
	#$AnimationPlayer.play("notez")

func _physics_process(_delta: float) -> void:
	if Global.boogie == true:
		$AnimationPlayer.play("notez")
	else:
		$AudioStreamPlayer.playing = false
		$AnimationPlayer.stop()
	
	if Global.boogiescore < 10:
		$Sprite.frame = 0
	elif Global.boogiescore < 20:
		$Sprite.frame = 1
	elif Global.boogiescore < 30:
		$Sprite.frame = 2
	elif Global.boogiescore < 45:
		$Sprite.frame = 3
	elif Global.boogiescore < 60:
		$Sprite.frame = 4
	elif Global.boogiescore >= 60:
		$Sprite.frame = 5
	
	$SCORE.text = String(Global.boogiescore)
