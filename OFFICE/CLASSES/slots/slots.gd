extends Spatial

var slot = false
var slot2 = false

var rng1 = RandomNumberGenerator.new()
var rng2 = RandomNumberGenerator.new()
var rng3 = RandomNumberGenerator.new()

var luck1
var luck2
var luck3

func _ready() -> void:
	$SLOT1.frame = 0
	$SLOT2.frame = 0
	$SLOT3.frame = 0
	

func _process(_delta: float) -> void:
	if slot == true:
		$SLOT1/AnimationPlayer.play("spin1")
		$SLOT2/AnimationPlayer.play("spin2")
		$SLOT3/AnimationPlayer.play("spin3")
		$AnimationPlayer2.play("spin4")
		rng1.randomize()
		luck1 = rng1.randi_range(1, 9)
		rng2.randomize()
		luck2 = rng2.randi_range(1, 9)
		rng3.randomize()
		luck3 = rng3.randi_range(1, 9)

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "spin1":
		$SLOT1.frame = luck1 + 4
		
	if anim_name == "spin2":
		$SLOT2.frame = luck2 + 4
		
	if anim_name == "spin3":
		$SLOT3.frame = luck3 + 4
		
	if anim_name == "spin4":
		slot2 = false
		
	slot = false
	
	print("A, ", luck1)
	print("B, ", luck2)
	print("C, ", luck3)


func _on_Area_area_entered(area: Area) -> void:
	if area.is_in_group("int"):
		if slot2 == false:
			slot = true
			slot2 = true
	if area.is_in_group("int"):
		if slot2 == false:
			slot = true
			slot2 = true

func _on_AudioStreamPlayer3D_finished() -> void:
	pass
	#$MACHINE2/AudioStreamPlayer3D.playing = false
	#$SLOT1/AudioStreamPlayer3D.playing = false
	#$SLOT2/AudioStreamPlayer3D.playing = false
	#$SLOT3/AudioStreamPlayer3D.playing = false
