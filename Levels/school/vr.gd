extends Node2D

var score = 0
var doo = 0
var progress = 1

var wae = false
var wag = false

func _ready() -> void:
	$AudioStreamPlayer.playing = false
	$Sprite/Button1.disabled = true
	$Sprite/Button2.disabled = true
	$Sprite/Button3.disabled = false
	$Sprite/Panel.visible = false
	$Sprite/Panel2.visible = true
	$Sprite/Panel3.visible = false
	#$AnimationPlayer2.play("New Anim (2)")

var did = false

func _physics_process(_delta: float) -> void:
	#print("A", doo)
	#print("B", progress)
	spriter()
	
	if wae == true:
		if wag == false:
			score = score + 1
			wae = false
			wag = true
	
	$Label.text = String(score)
	
	if $Sprite/Button1.disabled == true:
		$Sprite/Panel3.visible = true
	else:
		$Sprite/Panel3.visible = false
	
	if $Sprite/Button2.disabled == true:
		$Sprite/Panel.visible = true
	else:
		$Sprite/Panel.visible = false
	
	if $Sprite/Button3.disabled == true:
		$Sprite/Panel2.visible = true
	else:
		$Sprite/Panel2.visible = false
	
	if AA == true:
		if Input.is_action_just_pressed("move_sprint"):
			if BB == false:
				$AnimationPlayer.playback_speed += 0.2
				print("up!")
	
	if doo == 1:
		if did == false:
			$AnimationPlayer.play("ding")
			did = true
	if doo == 2:
		if did == false:
			$AnimationPlayer.play("ding")
			did = true

var AA = false
var BB = false

func spriter() -> void:
	if progress == 1:
		if doo == 0:
			$TEXT.text = "I wonder if I should buy this cheese..."
			$people/guy.texture = load("res://OFFICE/VR/guyz/c1 0.png")
			wae = false
			wag = false
		if doo == 1:
			$TEXT.text = "Yes! I shall purchase!"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c1 1.png")
			wae = true
		if doo == 2:
			$TEXT.text = "I DONT EVEN LIKE CHEESE!!!"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c1 2.png")
	if progress == 2:
		if doo == 0:
			$TEXT.text = "this apple is looking awfully scrumptious"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c2 0.png")
			wae = false
			wag = false
		if doo == 1:
			$TEXT.text = "I'll take it!"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c2 1.png")
			wae = true
		if doo == 2:
			$TEXT.text = "no! i want pretzel"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c2 2.png")
	if progress == 3:
		if doo == 0:
			$TEXT.text = "It's carrot time!"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c3 0.png")
			wae = false
			wag = false
		if doo == 1:
			$TEXT.text = "Take my money, good sir!"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c3 1.png")
			wae = true
		if doo == 2:
			$TEXT.text = "I'll just stick to cereal."
			$people/guy.texture = load("res://OFFICE/VR/guyz/c3 2.png")
	if progress == 4:
		if doo == 0:
			$TEXT.text = "GOTTA BUY"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c4 0.png")
			wae = false
			wag = false
		if doo == 1:
			$TEXT.text = "CORRECTAMUNDO"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c4 1.png")
			wae = true
		if doo == 2:
			$TEXT.text = "BLUE"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c4 2.png")
	if progress == 5:
		if doo == 0:
			$TEXT.text = "Delicious pink fluff!"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c5 0.png")
			wae = false
			wag = false
		if doo == 1:
			$TEXT.text = "You are the rightest guy in the land."
			$people/guy.texture = load("res://OFFICE/VR/guyz/c5 1.png")
			wae = true
		if doo == 2:
			$TEXT.text = "WHAT IF IT'S A BOMB!?!?"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c5 2.png")
	if progress == 6:
		if doo == 0:
			$TEXT.text = "I LOVE CORN"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c6 0.png")
			wae = false
			wag = false
		if doo == 1:
			$TEXT.text = "KEEP IT UP, BABY!"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c6 1.png")
			wae = true
		if doo == 2:
			$TEXT.text = "WHATEVER HAPPENED TO hashtag SAYYESTOSMEARIO!?"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c6 2.png")
	if progress == 7:
		if doo == 0:
			$TEXT.text = "grapes"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c7 0.png")
			wae = false
			wag = false
		if doo == 1:
			$TEXT.text = "Aw yeah!"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c7 1.png")
			wae = true
		if doo == 2:
			$TEXT.text = " "
			$people/guy.texture = load("res://OFFICE/VR/guyz/c7 2.png")
			$AudioStreamPlayer.volume_db = -80
	if progress == 8:
		if doo == 0:
			$TEXT.text = "Hello I am Homer Simpson"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c8 0.png")
			wae = false
			wag = false
			$AudioStreamPlayer.volume_db = -15
			#doo = 2
#		if doo == 1:
#			$TEXT.text = "hammer1"
#			$people/guy.texture = load("res://OFFICE/VR/guyz/c8 1.png")
#			wae = true
#		if doo == 2:
#			$TEXT.text = "hammer2"
#			$people/guy.texture = load("res://OFFICE/VR/guyz/c8 2.png")
	if progress == 9:
		if doo == 0:
			$TEXT.text = "Please look at my family"
			$AnimationPlayer.playback_speed = 3
			$people/guy.texture = load("res://OFFICE/VR/guyz/c8 0.png")
			wae = false
			wag = false
	if progress == 10:
		if doo == 0:
			$TEXT.text = "Marge Bouvier"
			$AnimationPlayer.playback_speed = 3
			$people/guy.texture = load("res://OFFICE/VR/guyz/c8 yello1.png")
			wae = false
			wag = false
	if progress == 11:
		if doo == 0:
			$TEXT.text = "Bart Simpson"
			$AnimationPlayer.playback_speed = 3
			$people/guy.texture = load("res://OFFICE/VR/guyz/c8 yello2.png")
			wae = false
			wag = false
	if progress == 12:
		if doo == 0:
			$TEXT.text = "Lisa Simpson"
			$AnimationPlayer.playback_speed = 3
			$people/guy.texture = load("res://OFFICE/VR/guyz/c8 yello3.png")
			wae = false
			wag = false
	if progress == 13:
		if doo == 0:
			$AnimationPlayer.playback_speed = 3
			$TEXT.text = "And finally, Maggie"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c8 yello4.png")
			wae = false
			wag = false
	if progress == 14:
		if doo == 0:
			$AnimationPlayer.playback_speed = 3
			$TEXT.text = "Thank you for meeting my family"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c8 0.png")
			wae = false
			wag = false
	if progress == 15:
		$AnimationPlayer.playback_speed = 1
		if doo == 0:
			$TEXT.text = "Can I have this bagel"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c8 3.png")
			wae = false
			wag = false
		if doo == 1:
			$TEXT.text = "Big thanks to you, fellow!"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c8 1.png")
			wae = true
		if doo == 2:
			$TEXT.text = "DOH!"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c8 2.png")
	if progress == 15:
		if doo == 0:
			$TEXT.text = "Can I have this bagel"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c8 3.png")
			wae = false
			wag = false
		if doo == 1:
			$TEXT.text = "Big thanks to you, fellow!"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c8 1.png")
			wae = true
		if doo == 2:
			$TEXT.text = "DOH!"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c8 2.png")
	if progress == 16:
		if doo == 0:
			$TEXT.text = "I BET YOU CANT PRESS THAT BIG GREEN BUTTON"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c9 0.png")
			wae = false
			wag = false
		if doo == 1:
			$TEXT.text = "My man!"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c9 1.png")
			wae = true
		if doo == 2:
			$TEXT.text = "oh ok"
			$people/guy.texture = load("res://OFFICE/VR/guyz/c9 2.png")
	if progress == 17:
		if AA == false:
			$AnimationPlayer.play("BOSS")
			AA = true
		$people/guy.visible = false
		$TEXT.visible = false
	
	

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "out":
		progress = progress + 1
		$AnimationPlayer.play("in")
		doo = 0
		did = false
	if anim_name == "in":
		if progress < 8:
			$Sprite/Button1.disabled = false
			$Sprite/Button2.disabled = false
		elif progress > 14:
			$Sprite/Button1.disabled = false
			$Sprite/Button2.disabled = false
		else:
			$Sprite/Button1.disabled = true
			$Sprite/Button2.disabled = true
			$Sprite/Button3.disabled = false
		if progress > 16:
			$Sprite/Button1.disabled = false
			$Sprite/Button2.disabled = false
	if anim_name == "start":
		print("DING!")
		Global.mouse = true
		$AnimationPlayer.play("in")
	
	if anim_name == "BOSS":
		$AnimationPlayer.play("ATTACK")
		$AnimationPlayer.playback_speed = 1
		BB = true
	
	if anim_name == "WIN":
		if score > 5:
			$AnimationPlayer.play("end1")
		if score < 6:
			$AnimationPlayer.play("end2")
	
	if anim_name == "end1":
		$AnimationPlayer.play("end")
		match Input.get_mouse_mode():
			Input.MOUSE_MODE_CAPTURED:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			Input.MOUSE_MODE_VISIBLE:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if anim_name == "end2":
		$AnimationPlayer.play("end")
		match Input.get_mouse_mode():
			Input.MOUSE_MODE_CAPTURED:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			Input.MOUSE_MODE_VISIBLE:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	if anim_name == "end":
		Global.control = true
		Global.miteedone = true
		Music.play4()

func _on_Button1_pressed() -> void:
	doo = 1
	print("ONE")
	$Sprite/Button1.disabled = true
	$Sprite/Button2.disabled = true
	$Sprite/Button3.disabled = false

func _on_Button2_pressed() -> void:
	doo = 2
	print("TWO")
	$Sprite/Button1.disabled = true
	$Sprite/Button2.disabled = true
	$Sprite/Button3.disabled = false

var WMO = false

func _on_Button3_pressed() -> void:
	$AnimationPlayer.play("out")
	print("THREE")
	$Sprite/Button3.disabled = true
	if progress == 15:
		if WMO == false:
			#$AnimationPlayer2.play("New Anim")
			WMO = true

func _on_mitee_start() -> void:
	$AnimationPlayer.play("start")

var A = false

func _on_guy_stop() -> void:
	$AnimationPlayer.stop()
	if score > 0:
		if A == false:
			score = score + 1
			A = true
