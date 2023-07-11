extends Spatial



func _ready() -> void:
	pass

var A = false

var bun = false
var bun2 = false

func _process(_delta: float) -> void:
	if A == false:
		if Global.cookdone == true:
			$nopass.queue_free()
			A = true
	
	if Global.cookdone == true:
		if bun2 == false:
			bun = true
			bun2 = true
	
	if bun == true:
		if Global.cookscore1 == 2:
			$ringz/YellowDonut3.queue_free()
		if Global.cookscore1 == 1:
			$ringz/YellowDonut2.queue_free()
			$ringz/YellowDonut3.queue_free()
		if Global.cookscore1 == 0:
			$ringz/YellowDonut.queue_free()
			$ringz/YellowDonut2.queue_free()
			$ringz/YellowDonut3.queue_free()
		
		if Global.cookscore2 == 2:
			$ringz/YellowDonut6.queue_free()
		if Global.cookscore2 == 1:
			$ringz/YellowDonut5.queue_free()
			$ringz/YellowDonut6.queue_free()
		if Global.cookscore2 == 0:
			$ringz/YellowDonut4.queue_free()
			$ringz/YellowDonut5.queue_free()
			$ringz/YellowDonut6.queue_free()
		bun = false

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "bong":
		$AnimationPlayer.play("start")
	if anim_name == "start":
		Global.cookstart = true
		Global.select = 2

func _on_Area_body_entered(body: Node) -> void:
	if body.name == "Player":
		$AnimationPlayer.play("bong")
		Music.play0()

func _on_AnimationPlayer_animation_started(anim_name: String) -> void:
	if anim_name == "end2":
		Music.play5()
		Global.select = 0
