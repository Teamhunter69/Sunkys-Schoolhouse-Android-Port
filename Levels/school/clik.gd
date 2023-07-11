extends Area2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CollisionShape2D.disabled = true

func _process(_delta: float) -> void:
	self.position = get_global_mouse_position()
	
	if Input.is_action_just_pressed("click"):
		$AnimationPlayer.play("clik")
