extends Area

var t = 0

func _ready() -> void:
	$CanvasLayer/AnimationPlayer.play("in")
	t = 0
	Escape.loading = false

func _on_t_area_entered(area: Area) -> void:
	if name == "tA1":
		if area.is_in_group("int"):
			t = 11
			$CanvasLayer/AnimationPlayer.play("out")
	
	if name == "t1":
		if area.is_in_group("int"):
			t = 1
			$CanvasLayer/AnimationPlayer.play("out")
	
	if name == "t2":
		if area.is_in_group("int"):
			t = 2
			$CanvasLayer/AnimationPlayer.play("out")
	
	if name == "t3":
		if area.is_in_group("int"):
			t = 3
			$CanvasLayer/AnimationPlayer.play("out")
	
	if name == "t4":
		if area.is_in_group("int"):
			t = 4
			$CanvasLayer/AnimationPlayer.play("out")
	
	if name == "t5":
		if area.is_in_group("int"):
			t = 5
			$CanvasLayer/AnimationPlayer.play("out")
	
	if name == "t6":
		if area.is_in_group("int"):
			t = 6
			$CanvasLayer/AnimationPlayer.play("out")
	
	if name == "t6b":
		if area.is_in_group("int"):
			t = 61
			$CanvasLayer/AnimationPlayer.play("out")
	
	if name == "t7":
		if area.is_in_group("int"):
			t = 7
			$CanvasLayer/AnimationPlayer.play("out")
	
	if name == "t8":
		if area.is_in_group("int"):
			t = 8
			$CanvasLayer/AnimationPlayer.play("out")
	
	if name == "tP":
		if area.is_in_group("int"):
			t = 71
			$CanvasLayer/AnimationPlayer.play("out")
	
	if name == "tA":
		if area.is_in_group("int"):
			t = 72
			$CanvasLayer/AnimationPlayer.play("out")
	
	if name == "e7":
		if area.is_in_group("int"):
			t = -7
			$CanvasLayer/AnimationPlayer.play("out")
	
	if name == "e6b":
		if area.is_in_group("int"):
			t = -61
			$CanvasLayer/AnimationPlayer.play("out")
	
	if name == "e6":
		if area.is_in_group("int"):
			t = -6
			$CanvasLayer/AnimationPlayer.play("out")
	
	if name == "e5":
		if area.is_in_group("int"):
			t = -5
			$CanvasLayer/AnimationPlayer.play("out")
	
	if name == "e4":
		if area.is_in_group("int"):
			t = -4
			$CanvasLayer/AnimationPlayer.play("out")
	
	if name == "e2":
		if area.is_in_group("int"):
			t = -2
			$CanvasLayer/AnimationPlayer.play("out")
	
	if name == "e1":
		if area.is_in_group("int"):
			t = -1
			$CanvasLayer/AnimationPlayer.play("out")

func _on_t4_body_entered(body: Node) -> void:
	if body.name == "Player":
		Global.to_floor4()
		t = 4
		$CanvasLayer/AnimationPlayer.play("out")


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "out":
		Escape.loading = true
		
		if t == 11:
			Global.to_floorA()
		
		if t == 1:
			Global.to_floor1()
		if t == 2:
			Global.to_floor2()
		if t == 3:
			Global.to_floor3()
		if t == 4:
			Global.to_floor4()
		if t == 5:
			Global.to_floor5()
		if t == 6:
			Global.to_floor6()
		if t == 61:
			Global.to_floor6B()
		if t == 7:
			Global.to_floor7()
		if t == 71:
			Global.to_floor7A()
		if t == 72:
			Global.to_floor7B()
		if t == 8:
			Global.to_floor8()
		
		if t == -1:
			Global.to_floorE1()
		if t == -2:
			Global.to_floorE2()
		if t == -3:
			Global.to_floorE3()
		if t == -4:
			Global.to_floorE4()
		if t == -5:
			Global.to_floorE5()
		if t == -6:
			Global.to_floorE6()
		if t == -61:
			Global.to_floorE6B()
		if t == -7:
			Global.to_floorE7()

func _on_e3_body_entered(body: Node) -> void:
	if body.name == "Player":
		Global.to_floorE3()
