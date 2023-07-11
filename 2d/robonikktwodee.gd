extends KinematicBody2D

export (int) var speed = 200

var right = true
var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		$AnimationPlayer.play("walk")
		right = true
	elif Input.is_action_pressed("move_left"):
		velocity.x -= 1
		$AnimationPlayer.play("walk")
		right = false
	else:
		$AnimationPlayer.play("idle")
	velocity = velocity.normalized() * speed

func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
	
	if right == true:
		$Sprite.scale.x = 1
	if right == false:
		$Sprite.scale.x = -1
