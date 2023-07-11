extends Spatial


func _ready() -> void:
	pass # Replace with function body.

func _physics_process(_delta: float) -> void:
	self.translation.y = 0

func _on_Timer_timeout() -> void:
	self.translation -= Global.pos
