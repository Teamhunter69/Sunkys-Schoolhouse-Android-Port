extends Area


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite3D.frame = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_SPEED_area_entered(area: Area) -> void:
	if area.is_in_group("hit"):
		$AnimationPlayer.play("boom")
		Global.SPEED = Global.SPEED + 1
