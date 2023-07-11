extends Area





func _ready() -> void:
	$CollisionShape.disabled = false


func _on_key_body_entered(body: Node) -> void:
	if body.name == "Player":
		if $aud.playing == true:
			Piano1.dance1 -= 1
			Piano1.dance1 += 1
			$aud.play()
		else:
			Piano1.dance1 += 1
			$aud.play()

func _on_aud_finished() -> void:
	Piano1.dance1 -= 1

