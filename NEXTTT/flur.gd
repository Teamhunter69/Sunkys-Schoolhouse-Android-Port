extends Spatial

var ding = 0
var dong = false

func _ready() -> void:
	$ESCAPE/CollisionShape.disabled = true
	$e7/CollisionShape.disabled = true
	Global.select = 0

func _process(_delta: float) -> void:
	if Global.debug == true:
		if Input.is_action_just_pressed("9"):
			Global.ESCAPE = true
	if Global.ESCAPE == true:
		$e7/CollisionShape.disabled = false
	else:
		$e7/CollisionShape.disabled = true

func _on_Area_area_entered(area: Area) -> void:
	if area.is_in_group("hit"):
		if dong == false:
			$Sprite3D.frame = $Sprite3D.frame + 1
			ding = ding + 1
			if ding < 4:
				$Sprite3D/AnimationPlayer.stop()
				$Sprite3D/AnimationPlayer.play("ding")
			elif ding < 5:
				Global.select = 0
				$Sprite3D/AnimationPlayer.play("dong")
				dong = true
				$ESCAPE/CollisionShape.disabled = false
				$e7/CollisionShape.disabled = false


func _on_ESCAPE_body_entered(body: Node) -> void:
	if body.name == "Player":
		if dong == true:
			$ESCAPE/CollisionShape.disabled = true
			Global.ESCAPE = true



func _on_insod_body_entered(body: Node) -> void:
	if body.name == "Player":
		$AnimationPlayer.play("here")
		$insod/CollisionShape.disabled = true

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "here":
		$AnimationPlayer.play("here2")
	if anim_name == "here2":
		Global.select = 1
