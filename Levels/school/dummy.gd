extends Sprite3D

var rng = RandomNumberGenerator.new()

var luck
var gold = false

func _ready() -> void:
	rng.randomize()
	luck = rng.randi_range(1, 1000)
	self.frame = 0
	$Area/CollisionShape.disabled = false
	goldn()

var dongle = false

func goldn():
	if luck == 1:
		gold = true
	if gold == true:
		print("LUCKY!")
		self.texture = load("res://DUMMY/dummy2.png")

func _on_Area_area_entered(area: Area) -> void:
	if area.is_in_group("hit"):
		if gold == true:
			print("WOWZERS!!! YOU'RE QUITE THE LUCKY FELLOW!")
			$AnimationPlayer.play("ow (copy)")
		else:
			$AnimationPlayer.play("ow")
		Global.dummy = Global.dummy + 1
	if area.is_in_group("pew"):
		print("nuh-uh! you can't do that one, bucko!")
