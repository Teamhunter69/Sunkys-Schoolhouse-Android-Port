extends Sprite3D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _process(_delta: float) -> void:
	if Global.miteedone == true:
		visible = false
		$StaticBody/CollisionShape.disabled = true
