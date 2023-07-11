extends Spatial


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/elevate.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Area_body_entered(body: Node) -> void:
	if body.name == "Player":
		$AnimationPlayer.play("goooo")
		Music.play0()
		Escape.pause = true


func _on_AnimationPlayer_animation_finished(_anim_name: String) -> void:
	if Global.floor3 == true:
		Global.to_floor4()
		
