extends Spatial

var open
var select = 1

var price1 = 10

func _on_Area_area_entered(area: Area) -> void:
	if area.is_in_group("hit"):
		$AnimationPlayer.play("open")
		Global.control = false
		open = true
		Global.shop = true

func _physics_process(_delta: float) -> void:
	if select < 1:
		select = 1
	if select > 9:
		select = 9
	
	updatea()
	selecta()
	
	$CanvasLayer/Control/DONUTCOUNTER.text = String(Global.rings)
	
	if open == true:
		if Input.is_action_pressed("move_jump"):
			$AnimationPlayer.play("close")
			Global.control = true
			open = false
			Global.shop = false
		if Input.is_action_just_pressed("click2"):
			if select == 1:
				if Global.rings > price1 - 1:
					Global.upgrade1 = Global.upgrade1 + 1
					Global.rings = Global.rings - price1
		if Input.is_action_just_pressed("move_right"):
			select = select + 1
		if Input.is_action_just_pressed("move_left"):
			select = select - 1

func selecta() -> void:
	if select == 1:
		$CanvasLayer/Control/A.visible = true
	if select == 2:
		$CanvasLayer/Control/A.visible = false
	if select == 3:
		$CanvasLayer/Control/A.visible = false
	if select == 4:
		$CanvasLayer/Control/A.visible = false
	if select == 5:
		$CanvasLayer/Control/A.visible = false
	if select == 6:
		$CanvasLayer/Control/A.visible = false
	if select == 7:
		$CanvasLayer/Control/A.visible = false
	if select == 8:
		$CanvasLayer/Control/A.visible = false
	if select == 9:
		$CanvasLayer/Control/A.visible = false

func updatea() -> void:
	if Global.upgrade1 == 0:
		price1 = 10
		$CanvasLayer/Control/A/A.visible = true
	if Global.upgrade1 == 1:
		price1 = 30
		$CanvasLayer/Control/A/A.visible = false
		$CanvasLayer/Control/A/A1.visible = true
	if Global.upgrade1 == 2:
		price1 = 80
		$CanvasLayer/Control/A/A1.visible = false
		$CanvasLayer/Control/A/A2.visible = true
	if Global.upgrade1 == 3:
		price1 = 150
		$CanvasLayer/Control/A/A2.visible = false
		$CanvasLayer/Control/A/A3.visible = true
	if Global.upgrade1 == 4:
		price1 = 260
		$CanvasLayer/Control/A/A3.visible = false
		$CanvasLayer/Control/A/A4.visible = true
	if Global.upgrade1 == 5:
		price1 = INF
		$CanvasLayer/Control/A/A4.visible = false
		$CanvasLayer/Control/A/A5.visible = true
