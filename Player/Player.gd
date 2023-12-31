extends KinematicBody

###################-VARIABLES-####################

# Camera
export(float) var mouse_sensitivity = 8.0
export(NodePath) var head_path = "Head"
export(NodePath) var cam_path = "Head/Camera"
export(float) var FOV = 80.0
var mouse_axis := Vector2()
onready var head: Spatial = get_node(head_path)
onready var cam: Camera = get_node(cam_path)
# Move
var velocity := Vector3()
var direction := Vector3()
var move_axis := Vector2()
var snap := Vector3()
var sprint_enabled := true
var sprinting := false
var stamina = INF
var maxstamina = INF
var staminabonus = 10

# Walk
const FLOOR_MAX_ANGLE: float = deg2rad(46.0)
export(float) var gravity = 30.0
export(int) var walk_speed = 5

export(int) var sprint_speed = 10
export(int) var DEFspeed = 10
export(int) var MAXspeed = 15

export(int) var faster = 1
export(int) var acceleration = 8
export(int) var deacceleration = 10
export(float, 0.0, 1.0, 0.05) var air_control = 0.3
export(int) var jump_height = 4
var _speed: int
var _is_sprinting_input := false
var _is_jumping_input := false

var punch = false
##################################################

var HTML = false

# Called when the node enters the scene tree
func _ready() -> void:
	cam.fov = FOV
	$Control/Stamina.visible = false
	$Control/Stamina2.visible = false
	$Control/Stamina3.visible = false
	
	$Area/Collision.disabled = true
	$Area3/CollisionShape.disabled = true

func speedy():
	if Global.SPEED == 0:
		MAXspeed = 15
		acceleration = 8
	if Global.SPEED == 1:
		MAXspeed = 16
		acceleration = 12
	
	if Global.ESCAPE == true:
		Global.SPEED = 2
		MAXspeed = 15
		acceleration = 20
		faster = 2

# Called every frame. 'delta' is the elapsed time since the previous frame
func _process(_delta: float) -> void:
	shopupgrade()
	speedy()
	
	
	if Input.is_action_pressed("up"):
		$Head/Camera.rotation_degrees.x += 3
	if Input.is_action_pressed("down"):
			$Head/Camera.rotation_degrees.x += -3
	if Input.is_action_pressed("left"):
			rotation_degrees.y += 3
	if Input.is_action_pressed("right"):
			rotation_degrees.y += -3
	
	
	
	if Global.hud2 == false:
		$Control.visible = false
	else:
		$Control.visible = true
	
	#print(punch)
	
	if Global.springa == true:
		translation.y += 1
		velocity.y = 30
		Global.springa = false
		$spring.play()
	
	#print("A", faster)
	#print("B", Global.SPEED)
	
	#if Global.cam == true:
	#	$Head/Camera.current = true
	#else:
	#	$Head/Camera.current = false
	
	if Input.is_action_just_pressed("click2"):
		$Area2/AnimationPlayer.play("click")
		if Global.boo == true:
			$Control/up.visible = false
			$Control/down.visible = false
			$Control/left.visible = false
			$Control/right.visible = false
			$Control/camup.visible = false
			$Control/camdown.visible = false
			$Control/camleft.visible = false
			$Control/camright.visible = false
			$Control/jump.visible = false
			$Control/Sprint.visible = false
		if Global.boo == false:
			$Control/up.visible = true
			$Control/down.visible = true
			$Control/left.visible = true
			$Control/right.visible = true
			$Control/camup.visible = true
			$Control/camdown.visible = true
			$Control/camleft.visible = true
			$Control/camright.visible = true
			$Control/jump.visible = true
			$Control/Sprint.visible = true
	if Global.touchscreen == false:
		$Control/up.visible = false
		$Control/down.visible = false
		$Control/left.visible = false
		$Control/right.visible = false
		$Control/camup.visible = false
		$Control/camdown.visible = false
		$Control/camleft.visible = false
		$Control/camright.visible = false
		$Control/riteclick.visible = false
		$Control/leftclick.visible = false
		$Control/jump.visible = false
		$Control/Sprint.visible = false
		$Control/Debug.visible = false
	if Global.debug == true and Global.touchscreen == true:
		$Control/Debug.visible = false
		$Control/one.visible = true
		$Control/two.visible = true
		$Control/three.visible = true
		$Control/four.visible = true
		$Control/five.visible = true
		$Control/six.visible = true
		$Control/seven.visible = true
		$Control/eight.visible = true
		$Control/SuperJump.visible = true
		$Control/itemswap.visible = true
		if Input.is_action_just_pressed("R"):
			$Control/AnimationPlayer.play("place")
			punch = true
			self.translation.y = self.translation.y + 10
	else:
		$Control/debug.visible = false
	#if Input.is_action_just_pressed("E"):
	#	Global.to_school()
	
	if Global.boogie == false:
		$Head/Camera.current = true
	else:
		$Head/Camera.current = false
	
	#print("A", $Control.visible)
	#print("B", HUD)
	
	#if stamina > 300:
	#	sprint_speed = ((stamina - 300) / 50) + staminabonus
	#else:
	#	sprint_speed = staminabonus
	
	#print(Global.hud)
	
	if Input.is_action_just_pressed("9"):
		if Global.hud2 == false:
			Global.hud2 = true
		else:
			Global.hud2 = false
	
	$Control/DONUTCOUNTER.text = " DONUTS: " + str(Global.rings)
	$Control/SPEEDCOUNTER.text = String(sprint_speed)
	
	upgrade()
	move_axis.x = Input.get_action_strength("move_forward") - Input.get_action_strength("move_backward")
	move_axis.y = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	
	if Global.control == true:
		if Input.is_action_just_pressed("move_jump"):
			_is_jumping_input = true
		
		if Input.is_action_pressed("move_sprint"):
			_is_sprinting_input = true
		

var run = 0

# Called every physics tick. 'delta' is constant
func _physics_process(delta: float) -> void:
	walk(delta)
	$Control/Stamina.value = stamina
	$Control/Stamina2.value = stamina
	$Control/Stamina3.value = stamina
	
	if Global.control == false:
		Input.action_release("move_forward")
		Input.action_release("move_backward")
		Input.action_release("move_left")
		Input.action_release("move_right")
		Input.action_release("move_jump")
	#	$Control/robotnik2.visible = false
	#else:
	#	$Control/robotnik2.visible = true
	
	if stamina == 0:
		walk_speed = 2
		$audio/sfx/sfx_run.playing = false
		$audio/sfx/sfx_BOOST1.playing = false
		$audio/sfx/sfx_BOOST2.playing = false
		$audio/sfx/sfx_BOOST3.playing = false
	else:
		walk_speed = 5
	
	if sprint_speed > MAXspeed:
		sprint_speed = MAXspeed
	
	
	if move_axis.y == 0 && move_axis.x == 0:
		if run == 1:
			if Global.stamina < 2:
				$audio/sfx/sfx_run.playing = false
			if Global.stamina == 2:
				pass
			run = 0
		if punch == false:
			if Global.select == 0:
				$Control/AnimationPlayer.play("idle")
			if Global.select == 1:
				$Control/AnimationPlayer.play("mallet1")
			if Global.select == 2:
				$Control/AnimationPlayer.play("pow1")
	else:
		if run == 1:
			if Input.is_action_just_released("move_sprint"):
				$audio/sfx/sfx_run.playing = false
				run = 0
			if is_on_floor():
				sprint_speed = sprint_speed + (0.01 * faster)
			else:
				sprint_speed = sprint_speed + ((0.01 * faster) * 5)
		if run == 0:
			if Input.is_action_pressed("move_sprint"):
				if Global.stamina < 2:
					$audio/sfx/sfx_run.playing = true
				if Global.stamina == 2:
					pass
				run = 1
			sprint_speed = DEFspeed
		if punch == false:
			if Global.select == 0:
				$Control/AnimationPlayer.play("run")
			if Global.select == 1:
				$Control/AnimationPlayer.play("mallet1")
			if Global.select == 2:
				$Control/AnimationPlayer.play("pow1")
	
	if Global.punch == true:
		if Input.is_action_pressed("clin"):
			punch = true
			if Global.select == 0:
				$Control/AnimationPlayer.play("punch")
			if Global.select == 1:
				$Control/AnimationPlayer.play("mallet2")
			if Global.select == 2:
				$Control/AnimationPlayer.play("pow2")

# Called when there is an input event
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		mouse_axis = event.relative
		camera_rotation()



func walk(delta: float) -> void:
	direction_input()
	
	
	
	if is_on_floor():
		snap = -get_floor_normal() - get_floor_velocity() * delta
		
		# Workaround for sliding down after jump on slope
		if velocity.y < 0:
			velocity.y = 0
		jump()
		
	else:
		# Workaround for 'vertical bump' when going off platform
		if snap != Vector3.ZERO && velocity.y != 0:
			velocity.y = 0
		jump()
		snap = Vector3.ZERO
		
		velocity.y -= gravity * delta
	
	sprint(delta)
	
	accelerate(delta)
	
	velocity = move_and_slide_with_snap(velocity, snap, Vector3.UP, true, 4, FLOOR_MAX_ANGLE)
	_is_jumping_input = false
	_is_sprinting_input = false


func camera_rotation() -> void:
	if HTML == false:
		if Input.get_mouse_mode() != Input.MOUSE_MODE_CAPTURED:
			return
		if mouse_axis.length() > 0:
			var horizontal: float = -mouse_axis.x * (mouse_sensitivity / 100)
			var vertical: float = -mouse_axis.y * (mouse_sensitivity / 100)
			
			mouse_axis = Vector2()
			
			rotate_y(deg2rad(horizontal))
			head.rotate_x(deg2rad(vertical))
			
			# Clamp mouse rotation
			var temp_rot: Vector3 = head.rotation_degrees
			temp_rot.x = clamp(temp_rot.x, -90, 90)
			head.rotation_degrees = temp_rot
	


func direction_input() -> void:
	direction = Vector3()
	var aim: Basis = get_global_transform().basis
	if move_axis.x >= 0.5:
		direction -= aim.z
	if move_axis.x <= -0.5:
		direction += aim.z
	if move_axis.y <= -0.5:
		direction -= aim.x
	if move_axis.y >= 0.5:
		direction += aim.x
	direction.y = 0
	direction = direction.normalized()


func accelerate(delta: float) -> void:
	# Where would the player go
	var _temp_vel: Vector3 = velocity
	var _temp_accel: float
	var _target: Vector3 = direction * _speed
	
	_temp_vel.y = 0
	if direction.dot(_temp_vel) > 0:
		_temp_accel = acceleration
		
	else:
		_temp_accel = deacceleration
	
	if not is_on_floor():
		_temp_accel *= air_control
	
	# Interpolation
	_temp_vel = _temp_vel.linear_interpolate(_target, _temp_accel * delta)
	
	velocity.x = _temp_vel.x
	velocity.z = _temp_vel.z
	
	# Make too low values zero
	if direction.dot(velocity) == 0:
		var _vel_clamp := 0.01
		if abs(velocity.x) < _vel_clamp:
			velocity.x = 0
		if abs(velocity.z) < _vel_clamp:
			velocity.z = 0

func upgrade() -> void:
	if Global.stamina == 0:
		maxstamina = INF
		$Control/Stamina.max_value = 100
		$Control/Stamina.rect_size.x = 320
		staminabonus = 10
		#sprint_speed = 10
	if Global.stamina == 1:
		maxstamina = INF
		$Control/Stamina.max_value = 200
		$Control/Stamina.rect_size.x = 640
		staminabonus = 15
		#sprint_speed = 15
	if Global.stamina == 2:
		maxstamina = INF
		$Control/Stamina.max_value = 300
		$Control/Stamina.rect_size.x = 980
		staminabonus = 20
		#sprint_speed = 20
	
	if Input.is_action_just_pressed("ui_focus_next"):
		if Global.stamina < 2:
			Global.stamina = Global.stamina + 1

var jumpa = true

func jump() -> void:
	if is_on_floor():
		jumpa = true
	
	if _is_jumping_input:
		if jumpa == true:
			velocity.y = jump_height
			snap = Vector3.ZERO
			$audio/sfx/sfx_boing.play()
			jumpa = false


func sprint(delta: float) -> void:
	if can_sprint():
		if stamina > 0:
			#$Control/AnimationPlayer.playback_speed = 2
			_speed = sprint_speed
			cam.set_fov(lerp(cam.fov, FOV * 1.05, delta * 8))
			sprinting = true
			stamina = stamina - 0.25
		else:
			$Control/AnimationPlayer.playback_speed = 1
			_speed = walk_speed
			cam.set_fov(lerp(cam.fov, FOV, delta * 8))
			sprinting = false
	else:
		$Control/AnimationPlayer.playback_speed = 1
		_speed = walk_speed
		cam.set_fov(lerp(cam.fov, FOV, delta * 8))
		sprinting = false


func can_sprint() -> bool:
	return (sprint_enabled and _is_sprinting_input and move_axis.x >= 0.5)


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "punch":
		punch = false
	if anim_name == "mallet2":
		punch = false
	if anim_name == "pow2":
		punch = false
	if anim_name == "place":
		punch = false


func _on_YellowDonut_ring() -> void:
	if stamina < 800:
		stamina = stamina + Global.upgrade1 * 3



func shopupgrade() -> void:
	if Global.upgrade1 == Global.upgrade1 + 1:
		print("pw")
		

