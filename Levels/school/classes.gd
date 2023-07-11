extends Spatial


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$DUK/AnimationPlayer.play("spin")

var A = false

func _process(_delta: float) -> void:
	$CanvasLayer/donuty.text = String(Global.pdonut)
	
	if Global.miteedone == true:
		if A == false:
			$CanvasLayer/donuty.visible = true
			Global.hud = true
			Global.control = true
			A = true

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "trees":
		$CanvasLayer/donuty.visible = false
