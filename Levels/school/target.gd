extends Sprite3D

var rng = RandomNumberGenerator.new()

var luck
var gold = false

func _ready() -> void:
	rng.randomize()
	luck = rng.randi_range(1, 1000)
	self.frame = 0
	$Area/CollisionShape.disabled = false
	

var dongle = false

func _physics_process(_delta: float) -> void:
	if luck == 1:
		gold = true
	if gold == true:
		#self.texture = load("res://DUMMY/dummy2.png")
		if dongle == false:
		#	print("LUCKY!")
			dongle = true
	#if Global.knuxdone == true:
	#	queue_free()

signal bam

func _on_Area_area_entered(area: Area) -> void:
	if area.is_in_group("pew"):
		$AnimationPlayer.play("ow")
		emit_signal("bam")
		if gold == true:
			print("CHA-CHING!!!")
		print("HIT!")
