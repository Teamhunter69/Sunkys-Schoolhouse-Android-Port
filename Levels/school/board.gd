extends Sprite3D

var start = false

var sprite

var ans = false

var spriteA = load("res://Levels/school/boards/boardA.png")
var spriteB = load("res://Levels/school/boards/boardB.png")
var sprite1 = load("res://Levels/school/boards/board1.png")
var sprite2 = load("res://Levels/school/boards/board2.png")
var sprite3 = load("res://Levels/school/boards/board3.png")
var sprite4 = load("res://Levels/school/boards/board4.png")
var sprite5 = load("res://Levels/school/boards/board5.png")
var sprite6 = load("res://Levels/school/boards/board6.png")

func _ready() -> void:
	$AnimationPlayer.play("start")
	if name == "board1":
		sprite = sprite1
	if name == "board2":
		sprite = sprite2
	if name == "board3":
		sprite = sprite3
	if name == "board4":
		sprite = sprite4
	if name == "board5":
		sprite = sprite5
	if name == "board6":
		sprite = sprite6

func _physics_process(_delta: float) -> void:
	if start == true:
		texture = sprite

func _on_Area_area_entered(area: Area) -> void:
	if area.is_in_group("int"):
		if ans == false:
			if name == "board1":
				if Global.number == 4:
					win()
				else:
					lose()
			if name == "board2":
				if Global.number == 5:
					win()
				else:
					lose()
			if name == "board3":
				if Global.number == 8:
					win()
				else:
					lose()
			if name == "board4":
				if Global.number == 3:
					win()
				else:
					lose()
			if name == "board5":
				if Global.number == 9:
					win()
				else:
					lose()
			if name == "board6":
				if Global.number == 2:
					win()
				else:
					lose()

func win():
	sprite = spriteA
	Global.number = -1
	ans = true
	Global.score = Global.score + 1
	Global.score2 = Global.score2 + 1
func lose():
	if Global.number > -1:
		sprite = spriteB
		Global.number = -1
		ans = true
		Global.score2 = Global.score2 + 1
		

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "start":
		start = true
