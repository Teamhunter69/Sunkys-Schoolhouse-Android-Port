extends Node

var alarm = preload("res://MUSIC/ESCAPEenv.tscn")
var instance = alarm.instance()

func _ready() -> void:
	$CanvasLayer/Label.visible = false
	$CanvasLayer/Panel.visible = false

var d = false

var time = 19.44

const TIMER_LIMIT = 1.0
var timer = 0.0

var pause = false

var end = false

var a = false

var loading = false

func _process(delta: float) -> void:
	if Global.ESCAPE == true:
		if time > 0:
			time -= delta
		else:
			$AnimationPlayer.play("2")
			$CanvasLayer/Panel.visible = true
		$AudioStreamPlayer.stream_paused = pause
		$CanvasLayer/Label.text = str(timer)
		
		if loading == true:
			pass
			#$AudioStreamPlayer3.stream_paused = true
		else:
			$AudioStreamPlayer3.stream_paused = false
		
		timer = int(round(time))
		
		if d == false:
			add_child(instance)
			$AnimationPlayer.play("1")
			d = true
			print("AAA")
	else:
		$CanvasLayer/Label.visible = false
		$CanvasLayer/Panel.visible = false
		$AudioStreamPlayer.stop()
		$AudioStreamPlayer.volume_db = -15
		time = 109.44
		if d == true:
			remove_child(instance)
			d = false
		if end == true:
				queue_free()

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "2":
		if Global.ESCAPE == true:
			Global.to_BOOM()


