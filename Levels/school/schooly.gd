extends Spatial

var begin = false

func _ready() -> void:
	Global.control = true
	
	Global.floor1 = true
	
	#$Player.translation = $Position3D.translation
	#$Player.rotation = $Position3D.rotation

const TIMER_LIMIT = 1.0
var timer = 0.0

func _process(delta: float) -> void:
	Global.posX = $Player.translation.x
	Global.posY = $Player.translation.y
	Global.posZ = $Player.translation.z
	Global.rot = $Player.rotation
	
	if Input.is_action_just_pressed("0"):
		$Player.translation = $Position3D.translation
	
	timer += delta
	if timer > TIMER_LIMIT: # Prints every 2 seconds
		timer = 0.0
		$CanvasLayer/Label.text = str(Engine.get_frames_per_second())
	



func _on_Area_body_entered(body: Node) -> void:
	if body.name == "Player":
		begin = true


func _on_Area1_body_entered(body: Node) -> void:
	if body.name == "Player":
		Global.floor1 = true

func _on_Area1_body_exited(body: Node) -> void:
	if begin == true:
		if body.name == "Player":
			#$floor1.visible = true
			#$floor2.visible = true
			#$floor3.visible = true
			#$floor4.visible = true
			#$floor5.visible = true
			Global.floor1 = false


func _on_Area2_body_entered(body: Node) -> void:
	if body.name == "Player":
		Global.floor2 = true

func _on_Area2_body_exited(body: Node) -> void:
	if begin == true:
		if body.name == "Player":
			#$floor1.visible = true
			#$floor2.visible = true
			#$floor3.visible = true
			#$floor4.visible = true
			#$floor5.visible = true
			Global.floor2 = false


func _on_Area3_body_entered(body: Node) -> void:
	if begin == true:
		if body.name == "Player":
			Global.floor3 = true

func _on_Area3_body_exited(body: Node) -> void:
	if begin == true:
		if body.name == "Player":
			Global.floor3 = false


func _on_Area4_body_entered(body: Node) -> void:
	if begin == true:
		if body.name == "Player":
			Global.floor4 = true

func _on_Area4_body_exited(body: Node) -> void:
	if begin == true:
		if body.name == "Player":
			#$floor1.visible = true
			#$floor2.visible = true
			#$floor3.visible = true
			#$floor4.visible = true
			Global.floor4 = false


func _on_Area5_body_entered(body: Node) -> void:
	if begin == true:
		if body.name == "Player":
			$floor3/knicknacks/CanvasLayer/TIMER.visible = false
			#Global.knuxdone = true
			Global.floor5 = true

func _on_Area5_body_exited(body: Node) -> void:
	if begin == true:
		if body.name == "Player":
			#$floor1.visible = true
			#$floor2.visible = true
			#$floor3.visible = true
			#$floor4.visible = true
			$floor5.visible = true
			Global.floor5 = false


