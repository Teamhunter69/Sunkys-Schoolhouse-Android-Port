extends Area

var lode = false

func _physics_process(_delta: float) -> void:
	if Global.sunkydone == true:
		lode = true
	#print(lode)

func _on_lode_body_entered(body: Node) -> void:
	if body.name == "Player":
		print("googoo")
		if lode == true:
			$AnimationPlayer.play("lode")
