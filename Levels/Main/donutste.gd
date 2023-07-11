extends Spatial

var go = true
var stored = 0
var collecting = false

var wait = false

func _physics_process(_delta: float) -> void:
	$Spatial/Viewport/Label.text = String(stored)
	if go == true:
		$AnimationPlayer.play("go")
	else:
		if wait == false:
			$AnimationPlayer.play("stop")
		$AnimationPlayer.playback_speed = 1
	if collecting == false:
		stored = 0
	
	if go == true:
		Global.s0 = true
	if go == false:
		Global.s0 = false
	


func _ready() -> void:
	self.translation = Global.pos
	self.rotation = Global.rot
	$AnimationPlayer.play("stop")

func _on_Area_area_entered(area: Area) -> void:
	if area.is_in_group("int"):
		if collecting == true:
			go = false
			collecting = false
			Global.rings = Global.rings + stored
		if wait == true:
			$AnimationPlayer.play("wait")
			wait = false
			go = true
	if area.is_in_group("hit"):
		$AnimationPlayer.play("bye")
		Global.rings = Global.rings + stored
	if area.is_in_group("c1"):
		Global.c1 = true
		Global.s0 = true
	if area.is_in_group("c2"):
		Global.c2 = true
		Global.s0 = true
	if area.is_in_group("c3"):
		Global.c3 = true
		Global.s0 = true
	if area.is_in_group("c4"):
		Global.c4 = true
		Global.s0 = true
	if area.is_in_group("c5"):
		Global.c5 = true
		Global.s0 = true
	if area.is_in_group("c6"):
		Global.c6 = true
		Global.s0 = true
	if area.is_in_group("c7"):
		Global.c7 = true
		Global.s0 = true
	if area.is_in_group("c8"):
		Global.c8 = true
		Global.s0 = true

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "go":
		stored = stored + 1
		collecting = true
		$AnimationPlayer.playback_speed = $AnimationPlayer.playback_speed + (Global.emeralds * 0.1)
	if anim_name == "stop":
		wait = true
	if anim_name == "bye":
		queue_free()


func _on_Area_area_exited(area: Area) -> void:
	if area.is_in_group("c1"):
		Global.c1 = false
		Global.s0 = false
	if area.is_in_group("c2"):
		Global.c2 = false
		Global.s0 = false
	if area.is_in_group("c3"):
		Global.c3 = false
		Global.s0 = false
	if area.is_in_group("c4"):
		Global.c4 = false
		Global.s0 = false
	if area.is_in_group("c5"):
		Global.c5 = false
		Global.s0 = false
	if area.is_in_group("c6"):
		Global.c6 = false
		Global.s0 = false
	if area.is_in_group("c7"):
		Global.c7 = false
		Global.s0 = false
	if area.is_in_group("c8"):
		Global.c8 = false
		Global.s0 = false
