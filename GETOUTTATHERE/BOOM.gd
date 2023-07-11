extends Node2D



func _ready() -> void:
	Global.ESCAPE = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		Global.to_floor8()
