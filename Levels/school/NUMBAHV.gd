extends Spatial


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _process(_delta: float) -> void:
	if Global.number == -1:
		$Sprite1.visible = false
		$Sprite2.visible = false
		$Sprite3.visible = false
		$Sprite4.visible = false
		$Sprite5.visible = false
		$Sprite6.visible = false
		$Sprite7.visible = false
		$Sprite8.visible = false
		$Sprite9.visible = false
	
	if Global.number == 1:
		one()
	if Global.number == 2:
		two()
	if Global.number == 3:
		three()
	if Global.number == 4:
		four()
	if Global.number == 5:
		five()
	if Global.number == 6:
		six()
	if Global.number == 7:
		seven()
	if Global.number == 8:
		eight()
	if Global.number == 9:
		nine()

func one():
	$Sprite1.visible = true
	$Sprite2.visible = false
	$Sprite3.visible = false
	$Sprite4.visible = false
	$Sprite5.visible = false
	$Sprite6.visible = false
	$Sprite7.visible = false
	$Sprite8.visible = false
	$Sprite9.visible = false

func two():
	$Sprite1.visible = false
	$Sprite2.visible = true
	$Sprite3.visible = false
	$Sprite4.visible = false
	$Sprite5.visible = false
	$Sprite6.visible = false
	$Sprite7.visible = false
	$Sprite8.visible = false
	$Sprite9.visible = false

func three():
	$Sprite1.visible = false
	$Sprite2.visible = false
	$Sprite3.visible = true
	$Sprite4.visible = false
	$Sprite5.visible = false
	$Sprite6.visible = false
	$Sprite7.visible = false
	$Sprite8.visible = false
	$Sprite9.visible = false

func four():
	$Sprite1.visible = false
	$Sprite2.visible = false
	$Sprite3.visible = false
	$Sprite4.visible = true
	$Sprite5.visible = false
	$Sprite6.visible = false
	$Sprite7.visible = false
	$Sprite8.visible = false
	$Sprite9.visible = false

func five():
	$Sprite1.visible = false
	$Sprite2.visible = false
	$Sprite3.visible = false
	$Sprite4.visible = false
	$Sprite5.visible = true
	$Sprite6.visible = false
	$Sprite7.visible = false
	$Sprite8.visible = false
	$Sprite9.visible = false

func six():
	$Sprite1.visible = false
	$Sprite2.visible = false
	$Sprite3.visible = false
	$Sprite4.visible = false
	$Sprite5.visible = false
	$Sprite6.visible = true
	$Sprite7.visible = false
	$Sprite8.visible = false
	$Sprite9.visible = false

func seven():
	$Sprite1.visible = false
	$Sprite2.visible = false
	$Sprite3.visible = false
	$Sprite4.visible = false
	$Sprite5.visible = false
	$Sprite6.visible = false
	$Sprite7.visible = true
	$Sprite8.visible = false
	$Sprite9.visible = false

func eight():
	$Sprite1.visible = false
	$Sprite2.visible = false
	$Sprite3.visible = false
	$Sprite4.visible = false
	$Sprite5.visible = false
	$Sprite6.visible = false
	$Sprite7.visible = false
	$Sprite8.visible = true
	$Sprite9.visible = false

func nine():
	$Sprite1.visible = false
	$Sprite2.visible = false
	$Sprite3.visible = false
	$Sprite4.visible = false
	$Sprite5.visible = false
	$Sprite6.visible = false
	$Sprite7.visible = false
	$Sprite8.visible = false
	$Sprite9.visible = true
