extends Area



var sprite1 = load("res://Levels/school/numbers/1.png")
var sprite2 = load("res://Levels/school/numbers/2.png")
var sprite3 = load("res://Levels/school/numbers/3.png")
var sprite4 = load("res://Levels/school/numbers/4.png")
var sprite5 = load("res://Levels/school/numbers/5.png")
var sprite6 = load("res://Levels/school/numbers/6.png")
var sprite7 = load("res://Levels/school/numbers/7.png")
var sprite8 = load("res://Levels/school/numbers/8.png")
var sprite9 = load("res://Levels/school/numbers/9.png")

func _ready() -> void:
	if Global.number > -1:
		self.translation.x = Global.posX
		self.translation.y = Global.posY + 999
		self.translation.z = Global.posZ
		self.rotation = Global.rot
	
	if name == "ONE":
		$Sprite3D.texture = sprite1
	if name == "TWO":
		$Sprite3D.texture = sprite2
	if name == "THREE":
		$Sprite3D.texture = sprite3
	if name == "FOUR":
		$Sprite3D.texture = sprite4
	if name == "FIVE":
		$Sprite3D.texture = sprite5
	if name == "SIX":
		$Sprite3D.texture = sprite6
	if name == "SEVEN":
		$Sprite3D.texture = sprite7
	if name == "EIGHT":
		$Sprite3D.texture = sprite8
	if name == "NINE":
		$Sprite3D.texture = sprite9

func _physics_process(_delta: float) -> void:
	if Global.number == -1:
		pass
func _on_NUMBER_area_entered(area: Area) -> void:
	if Global.number < 10:
		if area.is_in_group("int"):
			if name == "ONE":
				Global.number = 1
			if name == "TWO":
				Global.number = 2
			if name == "THREE":
				Global.number = 3
			if name == "FOUR":
				Global.number = 4
			if name == "FIVE":
				Global.number = 5
			if name == "SIX":
				Global.number = 6
			if name == "SEVEN":
				Global.number = 7
			if name == "EIGHT":
				Global.number = 8
			if name == "NINE":
				Global.number = 9
