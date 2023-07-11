extends Spatial

var slot = false

var rng = RandomNumberGenerator.new()

var luck

func _ready() -> void:
	$SLOT1.frame = 0
	$SLOT2.frame = 0
	$SLOT3.frame = 0
	

func _process(delta: float) -> void:
	if slot == true:
		luck = rng.randi_range(1, 10)

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	
