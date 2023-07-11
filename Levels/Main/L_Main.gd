extends Spatial

#-----------------SCENE--SCRIPT------------------#
#    Close your game faster by clicking 'Esc'    #
#   Change mouse mode by clicking 'Shift + F1'   #
#------------------------------------------------#

var text = true

onready var dnt = preload("res://donutste.tscn")

#func _ready() -> void:
	
	

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("click2"):
		if text == true:
			$RichTextLabel.visible = false
			text = false
	if Input.is_action_just_pressed("E"):
		if Global.s0 == false:
			if Global.inclass == true:
				var dot = dnt.instance()
				add_child(dot)
	Global.pos = $Player.translation
	Global.rot = $Player.rotation
