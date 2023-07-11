extends Spatial

var begin = false

func _ready() -> void:
	Global.control = true
	$AnimationPlayer.play("start")
	get_tree().paused = true
	call_deferred("_loading")
	
	if name == "pei":
		if Piano1.pee == true:
			$AnimationPlayer.play("start2")
		else:
			$AnimationPlayer.play("start")
	
	Music.playo()
	
	Escape.pause = false
	
	if name == "schoolyH":
		$AudioStreamPlayer.play()
	
	if Global.floor1 == true:
		Music.play1()
	if Global.floor2 == true:
		Music.play2()
	if Global.floor3 == true:
		Music.play3()
	if Global.floor4 == true:
		Music.play4()
	if Global.floor5 == true:
		Music.play5()
	if Global.floor6 == true:
		Music.play6()
	if Global.floor6B == true:
		Music.play6B()
	if Global.floor7 == true:
		Music.play0()
	if Global.floor8 == true:
		Music.play0()
	
	if Global.floorB == true:
		Music.playB()
	
	$CanvasLayer/Label.visible = false

func _loading() -> void:
	call_deferred("_start_game")

func _start_game() -> void:
	get_tree().paused = false



const TIMER_LIMIT = 1.0
var timer = 0.0

var bun = false
var bun2 = false

func _process(delta: float) -> void:
	Global.posX = $Player.translation.x
	Global.posY = $Player.translation.y
	Global.posZ = $Player.translation.z
	Global.rot = $Player.rotation
	
	if Global.debug == true:
		if Input.is_action_just_pressed("0"):
			$Player.translation = $Position3D.translation
	
	timer += delta
	if timer > TIMER_LIMIT: # Prints every 2 seconds
		timer = 0.0
		$CanvasLayer/Label.text = str(Engine.get_frames_per_second())
	

func _on_Area_body_entered(body: Node) -> void:
	if body.name == "Player":
		begin = true
