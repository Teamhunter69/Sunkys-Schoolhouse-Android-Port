extends Sprite3D


func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	$AnimationPlayer.playback_speed = 2
	$AnimationPlayer.play("dans")
