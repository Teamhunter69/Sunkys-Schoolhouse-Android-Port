extends Spatial

var doober = false

func _ready() -> void:
	$Area/CollisionShape.disabled = false

func _on_Area_area_entered(area: Area) -> void:
	if area.is_in_group("int"):
		$AnimationPlayer.play("open")

func _physics_process(_delta: float) -> void:
	#print("A", Global.score)
	#print("B", Global.score2)
	if Global.score2 == 3:
		if doober == false:
			$AnimationPlayer.play("move")
			doober = true
	ding()

func ding():
	if Global.score2 == 6:
		if Global.score > 0:
			$AnimationPlayer.play("win")
		if Global.score == 0:
			$AnimationPlayer.play("lose")
		Global.sunkydone = true
		if Global.score == 0:
			$YellowDonut.queue_free()
			$YellowDonut2.queue_free()
			$YellowDonut3.queue_free()
		elif Global.score < 3:
			$YellowDonut2.queue_free()
			$YellowDonut3.queue_free()
		elif Global.score < 6:
			$YellowDonut3.queue_free()
		else:
			pass
		Global.score2 = 0
