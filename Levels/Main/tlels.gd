extends Area

onready var path_follow = get_parent()

var status

export var speed = 10
var maxspeed = 1

func _physics_process(delta: float) -> void:
	path_follow.set_offset(path_follow.get_offset() + speed * delta)
	face()
	
	if Global.shop == false:
		if Global.s1 == false:
			if Global.s2 == false:
				speed = maxspeed
				status = 1
	
	#print("0", Global.s0)
	#print("1", Global.s1)
	#print("2", Global.s2)
	print(Global.emeralds * 0.1)
	
	if Global.shop == true:
		speed = 0
	if Global.s1 == true:
		speed = 0.5
		status = 2
	if Global.s2 == true:
		speed = 0
		status = 3
	
	if Global.inclass == true:
		maxspeed = 50
	else:
		maxspeed = 10

func face():
	if status == 1:
		$tface/normal.visible = true
		$tface/huh.visible = false
		$tface/gasp.visible = false
		$tface/happy.visible = false
		$tface/huh2.visible = false
	if status == 2:
		$tface/normal.visible = false
		$tface/huh.visible = true
		$tface/gasp.visible = false
		$tface/happy.visible = false
		$tface/huh2.visible = false
	if status == 3:
		$tface/normal.visible = false
		$tface/huh.visible = false
		$tface/gasp.visible = true
		$tface/happy.visible = false
		$tface/huh2.visible = false
		get_tree().quit()
	if status == 4:
		$tface/normal.visible = false
		$tface/huh.visible = false
		$tface/gasp.visible = false
		$tface/happy.visible = true
		$tface/huh2.visible = false
	if status == 5:
		$tface/normal.visible = false
		$tface/huh.visible = false
		$tface/gasp.visible = false
		$tface/happy.visible = false
		$tface/huh2.visible = true
