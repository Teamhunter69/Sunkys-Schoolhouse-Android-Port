extends Node2D

var doo = false


func _ready() -> void:
	doo = false


func _on_Area2D_body_entered(body: Node) -> void:
	if body.name == "Player":
		doo = true

func _on_Area2D_body_exited(body: Node) -> void:
	if body.name == "Player":
		doo = false


func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("move_forward"):
		if doo == true:
			Global.to_school()
