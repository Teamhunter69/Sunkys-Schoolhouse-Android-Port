extends Sprite

var hp = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

signal stop

var STOP = false

func _process(_delta: float) -> void:
	$Label2.text = String(hp)
	
	if Input.is_action_just_pressed("bosshurt"):
		hp = 1
	if Input.is_action_just_pressed("vr_workaround"):
		hp = hp - 1
	if hp < 1:
		if STOP == false:
			$AnimationPlayer.play("WIN")
			emit_signal("stop")
			STOP = true

func _on_Area2D_area_entered(area: Area2D) -> void:
	if area.is_in_group("hit"):
		hp = hp - 1


func _on_AnimationPlayer3_animation_started(anim_name: String) -> void:
	if anim_name == "ATTACK":
		$Area2D/CollisionShape2D.disabled = false
		$Area2D/CollisionShape2D2.disabled = false
		$Area2D/CollisionShape2D3.disabled = false
		$Area2D/CollisionShape2D4.disabled = false
		$Area2D/CollisionShape2D5.disabled = false
		$Area2D/CollisionShape2D6.disabled = false
		$Area2D/CollisionShape2D7.disabled = false
		$Area2D/CollisionShape2D8.disabled = false
		$Area2D/CollisionShape2D9.disabled = false
