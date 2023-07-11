extends Area

func _ready() -> void:
	if self.name == "MUMMYRAP":
		$AudioStreamPlayer.volume_db = -80
		$AudioStreamPlayer3D.unit_db = 5
		$AudioStreamPlayer3D.playing = true
	
	if name == "CREM":
		$AudioStreamPlayer.volume_db = -80
		$AudioStreamPlayer3D.unit_db = 5
		$AudioStreamPlayer.stream_paused = true
		$AudioStreamPlayer3D.stream_paused = true
		$AudioStreamPlayer3D.playing = true
	if self.name == "JULIADANS":
		$AudioStreamPlayer.volume_db = -80
		$AudioStreamPlayer3D.unit_db = -5
		$AudioStreamPlayer3D.playing = true

func _on_Area_body_entered(body: Node) -> void:
	if body.name == "Player":
		Music.play0()
		if self.name == "MUMMYRAP":
			$AudioStreamPlayer.volume_db = 0
			$AudioStreamPlayer3D.unit_db = -80
		if self.name == "CREM":
			$AudioStreamPlayer.volume_db = -10
			$AudioStreamPlayer3D.unit_db = -80
			$AudioStreamPlayer.stream_paused = false
			$WorldEnvironment.environment = load("res://OFFICE/CLASSES/crem/scare.tres")
		if self.name == "JULIADANS":
			$AudioStreamPlayer.volume_db = -15
			$AudioStreamPlayer3D.unit_db = -80

func _on_Area_body_exited(body: Node) -> void:
	if body.name == "Player":
		Music.play4()
		if self.name == "MUMMYRAP":
			$AudioStreamPlayer.volume_db = -80
			$AudioStreamPlayer3D.unit_db = 5
		if self.name == "CREM":
			$AudioStreamPlayer.volume_db = -80
			$AudioStreamPlayer.stream_paused = true
			$AudioStreamPlayer3D.unit_db = 0
			$WorldEnvironment.environment = load("res://OFFICE/CLASSES/crem/none.tres")
		if self.name == "JULIADANS":
			$AudioStreamPlayer.volume_db = -80
			$AudioStreamPlayer3D.unit_db = -15
