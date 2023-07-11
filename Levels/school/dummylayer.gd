extends CanvasLayer


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(_delta: float) -> void:
	if Global.select == 1:
		if Global.knuxdone == false:
			$SCORE.visible = true
		else:
			$SCORE.visible = false
	else:
		$SCORE.visible = false
	$SCORE.text = str(Global.dummy) + " / 330"
	
	if Global.dummy == 330:
		Global.knuxdone = true
