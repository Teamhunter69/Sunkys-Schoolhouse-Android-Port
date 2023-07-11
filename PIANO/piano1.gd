extends Sprite3D



var dance = false
var dance1

var pee = false

func _ready() -> void:
	dance1 = 0

func _process(_delta: float) -> void:
	
	if dance1 > 0:
		dance = true
	else:
		dance = false
