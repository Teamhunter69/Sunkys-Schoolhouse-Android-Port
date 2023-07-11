extends Sprite3D

var time = 6000
var start = false

func _ready() -> void:
	$StaticBody/CollisionShape.disabled = false
	$Area2/CollisionShape.disabled = false
	$StaticBody/Sprite3D.visible = true

var dingus = false

func _physics_process(_delta: float) -> void:
	if Global.select == 1:
		if Global.knuxdone == false:
			$CanvasLayer/TIMER.visible = true
		else:
			$CanvasLayer/TIMER.visible = false
	else:
		$CanvasLayer/TIMER.visible = false
	
	$CanvasLayer/TIMER.text = "TIME LEFT:" + str(time)
	
	if time < 1:
		Global.knuxdone = true
		if dingus == false:
			$knuxanim.play("lose")
			dingus = true
	
	if Global.knuxdone == true:
		if dingus == false:
			if time > 1000:
				$knuxanim.play("win")
			elif time > 1:
				$knuxanim.play("win2")
			dingus = true
	
	if start == true:
		time = time - 1

func _on_Area_area_entered(area: Area) -> void:
	if area.is_in_group("int"):
		if Global.knuxdone == false:
			if Global.select == 1:
				$knuxanim.play("start")
				start = true


func _on_Area2_body_entered(body: Node) -> void:
	if body.name == "Player":
		Global.punch = true
		$knuxanim.play("hi")
