extends Sprite3D


func _ready() -> void:
	$animtlels.play("start")


func _on_Area_area_entered(area: Area) -> void:
	if area.is_in_group("int"):
		$animtlels.play("star")
		Global.control = false
		Global.hud2 = true

var en = false

var doober = false

func _physics_process(_delta: float) -> void:
	if Global.tlelsdone == true:
		if en == false:
			$animtlels.play("en")
			en = true
			Global.hud2 = true
	
	if $TRIGGAH.visible == true:
		if doober == false:
			if Global.boogiescore < 30:
				$D.playing = true
			elif Global.boogiescore < 60:
				$woogie.playing = true
			elif Global.boogiescore >= 60:
				$F.playing = true
			doober = true

func _on_animtlels_animation_finished(anim_name: String) -> void:
	if anim_name == "star":
		Global.boogie = true
		self.visible = false
		Music.play0()
	

func _on_D_finished() -> void:
	$D.queue_free()

func _on_F_finished() -> void:
	$F.queue_free()

func _on_woogie_finished() -> void:
	$woogie.queue_free()
