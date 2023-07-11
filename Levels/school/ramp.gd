extends CSGBox

func _ready() -> void:
	$StaticBody/CollisionShape.scale.x = width * 5
	$StaticBody/CollisionShape.scale.y = height * 5
	$StaticBody/CollisionShape.scale.z = depth * 5

func _physics_process(_delta: float) -> void:
	#$StaticBody/CollisionShape.scale.x = width * 5
	#$StaticBody/CollisionShape.scale.y = height * 5
	#$StaticBody/CollisionShape.scale.z = depth * 5
	pass
