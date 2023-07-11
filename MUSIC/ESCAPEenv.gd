extends WorldEnvironment


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.ESCAPE == true:
		$AnimationPlayer.play("start")

func _process(_delta: float) -> void:
	if Global.ESCAPE == false:
		queue_free()

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "start":
		$AnimationPlayer.play("alarm")
