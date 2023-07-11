extends Sprite3D

signal start

var dungle = false
var JOSEPH = false
var J = 0

func _ready() -> void:
	$Sprite3D/Area/CollisionShape.disabled = false
	$AnimationPlayer.play("C")

var T = false

var playing = false

func _physics_process(_delta: float) -> void:
	if J > 8:
		if dungle == false:
			JOSEPH = true
			$AnimationPlayer2.play("New Anim")
			dungle = true
	
	if JOSEPH == true:
		texture = load("res://OFFICE/desk2.png")
	
	if playing == true:
		if Input.is_action_pressed("ui_accept"):
			$AnimationPlayer.playback_speed = 20
		else:
			$AnimationPlayer.playback_speed = 1
	
	if Global.debug == true:
		if Input.is_action_just_pressed("8"):
			Global.pdonut = 37
	if Global.pdonut == 37:
		if T == false:
			$AnimationPlayer.play("T")
			T = true

var A = false

func _on_Area_area_entered(area: Area) -> void:
	if area.is_in_group("hit"):
		J = J + 1
	
	if Global.pdonut < 37:
		if area.is_in_group("int"):
			$AnimationPlayer.play("cheese")
			playing = true
			Global.select = 0
			Global.control = false
			if A == false:
				$Sprite3D.visible = false
				$Sprite3D/Area/CollisionShape.disabled = true
				$Sprite3D.translation.y = $Sprite3D.translation.y + 999999
				A = true
	else:
		$AnimationPlayer.play("trees")

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "cheese":
		#Global.control = true
		emit_signal("start")
		playing = false
		$AnimationPlayer.playback_speed = 1
	
	
	
	if anim_name == "trees":
		Global.control = true
		Music.play4()
		playing = false
		$AnimationPlayer.playback_speed = 1

func _on_AnimationPlayer_animation_started(anim_name: String) -> void:
	if anim_name == "cheese":
		Music.play0()
		$Sprite3D/Area/CollisionShape.disabled = true
		$Area223/CollisionShape.disabled = true
	if anim_name == "trees":
		Global.control = false
		Music.play0()
