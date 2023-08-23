extends Node

#-----------------SCENE--SCRIPT------------------#
#    Close your game faster by clicking 'Esc'    #
#   Change mouse mode by clicking 'Shift + F1'   #
#------------------------------------------------#

var ESCAPE = false

var stamina = 0

var rings = 0
var pdonut = 0
var emeralds = 0

var key = 0

var SPEED = 0

var select = 0

var room = "hallway"

var shop = false
var score = 0
var score2 = 0

var sunkydone = false
var boogie = false
var boogiescore = 0
var tlelsdone = false
var dummy = 0
var knuxdone = false
var miteedone = false
var cookstart = false
var cookdone = false
var cookscore1 = 0
var cookscore2 = 0

var springa = false

var hud = false
var hud2 = true


var control = true
var punch = false

var posX
var posY
var posZ
var rot

#export var fast_close := true

var floor1 = false
var floor2 = false
var floor3 = false
var floor4 = false
var floor5 = false
var floor6 = false
var floor6B = false
var floor7 = false
var floor8 = false

var floorB = false

var upgrade1 = 0


#func _ready() -> void:
#	if !OS.is_debug_build():
#		fast_close = false
#	
#	if fast_close:
#		print("** Fast Close enabled in the 'L_Main.gd' script **")
#		print("** 'Esc' to close 'Shift + F1' to release mouse **")


var number = -1

var cam = true
var touchscreen = true

var mouse = false
var boo = false
var debug = false


func _physics_process(_delta: float) -> void:
	if debug == true:
		if Input.is_action_just_pressed("select"):
			select = select + 1
			punch = true
		
		if Input.is_action_just_released("select"):
			select = select + 1
			punch = true
		if Input.is_action_just_released("select2"):
			select = select - 1
			punch = true
		if select == 3:
			select = 0
		if select == -1:
			select = 2
	
	if select > 0:
		punch = true
	else:
		punch = false
	
	if Input.is_action_just_pressed("debug"):
		if debug == false:
			debug = true
	
	if debug == true:
		if ESCAPE == false:
			if Input.is_action_just_pressed("1"):
				to_floor1()
			if Input.is_action_just_pressed("2"):
				to_floor2()
			if Input.is_action_just_pressed("3"):
				to_floor3()
			if Input.is_action_just_pressed("4"):
				to_floor4()
			if Input.is_action_just_pressed("5"):
				to_floor5()
			if Input.is_action_just_pressed("6"):
				to_floor6()
			if Input.is_action_just_pressed("7"):
				to_floor6B()
			if Input.is_action_just_pressed("8"):
				to_floor7()
		else:
			if Input.is_action_just_pressed("1"):
				to_floorE1()
			if Input.is_action_just_pressed("2"):
				to_floorE2()
			if Input.is_action_just_pressed("3"):
				to_floorE3()
			if Input.is_action_just_pressed("4"):
				to_floorE4()
			if Input.is_action_just_pressed("5"):
				to_floorE5()
			if Input.is_action_just_pressed("6"):
				to_floorE6()
			if Input.is_action_just_pressed("7"):
				to_floorE6B()
			if Input.is_action_just_pressed("8"):
				to_floorE7()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"): #and fast_close:
		pass
		#get_tree().quit() # Quits the game
	
	if event.is_action_pressed("mouse_input"):# and fast_close:
		if mouse == false:
			mouse = true
	if mouse == true:
		mouse = false
		match Input.get_mouse_mode():
			Input.MOUSE_MODE_CAPTURED:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			Input.MOUSE_MODE_VISIBLE:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

onready var current_scene = get_tree().get_root().get_child(
			get_tree().get_root().get_child_count() - 1
		)

func change_scene( target_scene ):
	var ERR = get_tree().change_scene(target_scene)
	if ERR != OK:
		print ("something freakin messed up bro")

func to_title():
	change_scene("res://TITLE.tscn")

func to_warn():
	change_scene("res://WARN.tscn")

func to_intro():
	change_scene("res://INTRO.tscn")

func to_school():
	change_scene("res://Levels/school/schooly.tscn")

func to_floorA():
	change_scene("res://Levels/school/schoolyA.tscn")
	Global.floor1 = false
	Global.floor2 = false
	Global.floor3 = false
	Global.floor4 = false
	Global.floor5 = false
	Global.floor6 = false
	Global.floor6B = false
	Global.floor7 = false
	Global.floor8 = false
	Global.floorB = true

func to_floor1():
	change_scene("res://Levels/school/schooly1.tscn")
	Global.floor1 = true
	Global.floor2 = false
	Global.floor3 = false
	Global.floor4 = false
	Global.floor5 = false
	Global.floor6 = false
	Global.floor6B = false
	Global.floor7 = false
	Global.floor8 = false
	Global.floorB = false

func to_floor2():
	change_scene("res://Levels/school/schooly2.tscn")
	Global.floor1 = false
	Global.floor2 = true
	Global.floor3 = false
	Global.floor4 = false
	Global.floor5 = false
	Global.floor6 = false
	Global.floor6B = false
	Global.floor7 = false
	Global.floor8 = false
	Global.floorB = false

func to_floor3():
	change_scene("res://Levels/school/schooly3.tscn")
	Global.floor1 = false
	Global.floor2 = false
	Global.floor3 = true
	Global.floor4 = false
	Global.floor5 = false
	Global.floor6 = false
	Global.floor6B = false
	Global.floor7 = false
	Global.floor8 = false
	Global.floorB = false

func to_floor4():
	change_scene("res://Levels/school/schooly4.tscn")
	Global.floor1 = false
	Global.floor2 = false
	Global.floor3 = false
	Global.floor4 = true
	Global.floor5 = false
	Global.floor6 = false
	Global.floor6B = false
	Global.floor7 = false
	Global.floor8 = false
	Global.floorB = false

func to_floor5():
	change_scene("res://Levels/school/schooly5.tscn")
	Global.floor1 = false
	Global.floor2 = false
	Global.floor3 = false
	Global.floor4 = false
	Global.floor5 = true
	Global.floor6 = false
	Global.floor6B = false
	Global.floor7 = false
	Global.floor8 = false
	Global.floorB = false

func to_floor6():
	change_scene("res://Levels/school/schooly6.tscn")
	Global.floor1 = false
	Global.floor2 = false
	Global.floor3 = false
	Global.floor4 = false
	Global.floor5 = false
	Global.floor6 = true
	Global.floor6B = false
	Global.floor7 = false
	Global.floor8 = false
	Global.floorB = false

func to_floor6B():
	change_scene("res://Levels/school/schooly6B.tscn")
	Global.floor1 = false
	Global.floor2 = false
	Global.floor3 = false
	Global.floor4 = false
	Global.floor5 = false
	Global.floor6 = false
	Global.floor6B = true
	Global.floor7 = false
	Global.floor8 = false
	Global.floorB = false

func to_floor7():
	change_scene("res://Levels/school/schooly7.tscn")
	Global.floor1 = false
	Global.floor2 = false
	Global.floor3 = false
	Global.floor4 = false
	Global.floor5 = false
	Global.floor6 = false
	Global.floor6B = false
	Global.floor7 = true
	Global.floor8 = false
	Global.floorB = false

func to_floor7A():
	change_scene("res://PIANO/piannnnn.tscn")
	Global.floor1 = false
	Global.floor2 = false
	Global.floor3 = false
	Global.floor4 = false
	Global.floor5 = false
	Global.floor6 = false
	Global.floor6B = false
	Global.floor7 = true
	Global.floor8 = false
	Global.floorB = false

func to_floor7B():
	change_scene("res://PIANO/piano.tscn")

func to_floor8():
	change_scene("res://Levels/school/schooly8.tscn")
	Global.floor1 = false
	Global.floor2 = false
	Global.floor3 = false
	Global.floor4 = false
	Global.floor5 = false
	Global.floor6 = false
	Global.floor6B = false
	Global.floor7 = false
	Global.floor8 = true
	Global.floorB = false

func to_floorE7():
	change_scene("res://Levels/school/escape/schooly7E.tscn")

func to_floorE6B():
	change_scene("res://Levels/school/escape/schooly6BE.tscn")

func to_floorE6():
	change_scene("res://Levels/school/escape/schooly6E.tscn")

func to_floorE5():
	change_scene("res://Levels/school/escape/schooly5E.tscn")

func to_floorE4():
	change_scene("res://Levels/school/escape/schooly4E.tscn")

func to_floorE3():
	change_scene("res://Levels/school/escape/schooly3E.tscn")

func to_floorE2():
	change_scene("res://Levels/school/escape/schooly2E.tscn")

func to_floorE1():
	change_scene("res://Levels/school/escape/schooly1E.tscn")

func to_BOOM():
	change_scene("res://GETOUTTATHERE/BOOM.tscn")

func to_END():
	change_scene("res://GETOUTTATHERE/end.tscn")

func to_credits():
	change_scene("res://GETOUTTATHERE/ENDING/music/credits.tscn")
