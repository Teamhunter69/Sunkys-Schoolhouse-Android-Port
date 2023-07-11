extends Spatial

var start = false
var going = false
var collect = false

#triggers
var prepA = false
var prepB = false

var fridgeA = false
var fridgeB = false

var cabinetA = false
var cabinetB = false

var ovenA = false
var ovenB = false

var toastA = false
var toastB = false

#scores
var score1 = 0
var score2 = 0
var time = 117
var timer = 0
var speed = 0.75

#ingredients
var MILK = false
var CEREAL = false
var COOKIES = false
var BREAD = false
var BUTTER = false
var TOAST = false
var CHEESE = false
var BACON = false
var ICECREAM = false
var APPLE = false

#meals
var MC = false
var BC = false
var BT = false
var CB = false
var IC = false
var AJ = false

var progress = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset()
	$CanvasLayer/READY.visible = false
	#$CanvasLayer/SCORE1.visible = false
	#$CanvasLayer/SCORE2.visible = false
	$Label.visible = false
	$CanvasLayer/aniflasher.play("flash")

var doooooo = false

func target():
	if start == true:
		if doooooo == false:
			$targets/AnimationPlayer.play("target")
			$targets2/AnimationPlayer.play("target")
			doooooo = true
		$targets/AnimationPlayer.playback_speed = 1 + (score1 / 25)
		$targets2/AnimationPlayer.playback_speed = 1 + (score1 / 25)

var dung = 0.01

func _on_target_bam() -> void:
	score2 = score2 + 4
	speed = 0.75 + (dung)
	dung = dung + 0.01

func score():
	$CanvasLayer/SCORE1.text = "SCORE: " + str(score1)
	$CanvasLayer/SCORE2.text = "SCORE: " + str(score2)

func rank():
	if score2 > 49:
		$rankz/R/rr1.visible = false
		$rankz/R/rr2.visible = true
	else:
		$rankz/R/rr1.visible = true
		$rankz/R/rr2.visible = false
	if score1 > 49:
		$rankz/R/rr3.visible = false
		$rankz/R/rr4.visible = true
	else:
		$rankz/R/rr3.visible = true
		$rankz/R/rr4.visible = false
	
	if score1 > 99:
		$rankz/R/rank2.frame = 5
		$EMfantastic.volume_db = -17
		$EMgood.volume_db = -80
		$EMhorrible.volume_db = -80
		Global.cookscore1 = 3
	elif score1 > 79:
		$rankz/R/rank2.frame = 4
		$EMfantastic.volume_db = -80
		$EMgood.volume_db = -17
		$EMhorrible.volume_db = -80
		Global.cookscore1 = 2
	elif score1 > 59:
		$rankz/R/rank2.frame = 3
		$EMfantastic.volume_db = -80
		$EMgood.volume_db = -17
		$EMhorrible.volume_db = -80
		Global.cookscore1 = 2
	elif score1 > 39:
		$rankz/R/rank2.frame = 2
		$EMfantastic.volume_db = -80
		$EMgood.volume_db = -17
		$EMhorrible.volume_db = -80
		Global.cookscore1 = 1
	elif score1 > 19:
		$rankz/R/rank2.frame = 1
		$EMfantastic.volume_db = -80
		$EMgood.volume_db = -80
		$EMhorrible.volume_db = -17
		Global.cookscore1 = 1
	elif score1 > -1:
		$rankz/R/rank2.frame = 0
		$EMfantastic.volume_db = -80
		$EMgood.volume_db = -80
		$EMhorrible.volume_db = -17
		Global.cookscore1 = 0
	
	if score2 > 99:
		$rankz/R/rank1.frame = 5
		$SHfantastic.volume_db = -8
		$SHgood.volume_db = -80
		$SHhorrible.volume_db = -80
		Global.cookscore2 = 3
	elif score2 > 79:
		$rankz/R/rank1.frame = 4
		$SHfantastic.volume_db = -80
		$SHgood.volume_db = -8
		$SHhorrible.volume_db = -80
		Global.cookscore2 = 2
	elif score2 > 59:
		$rankz/R/rank1.frame = 3
		$SHfantastic.volume_db = -80
		$SHgood.volume_db = -8
		$SHhorrible.volume_db = -80
		Global.cookscore2 = 2
	elif score2 > 39:
		$rankz/R/rank1.frame = 2
		$SHfantastic.volume_db = -80
		$SHgood.volume_db = -8
		$SHhorrible.volume_db = -80
		Global.cookscore2 = 1
	elif score2 > 19:
		$rankz/R/rank1.frame = 1
		$SHfantastic.volume_db = -80
		$SHgood.volume_db = -80
		$SHhorrible.volume_db = -8
		Global.cookscore2 = 1
	elif score2 > -1:
		$rankz/R/rank1.frame = 0
		$SHfantastic.volume_db = -80
		$SHgood.volume_db = -80
		$SHhorrible.volume_db = -8
		Global.cookscore2 = 0

func _process(delta: float) -> void:
	if collect == true:
		$CanvasLayer/ProgressBar.value = $CanvasLayer/ProgressBar.value + speed
	else:
		$CanvasLayer/ProgressBar.value = 0
	if $CanvasLayer/ProgressBar.value == 100:
		check()
	
	target()
	rank()
	
	if Global.cookstart == true:
		start = true
	
	if time < 1:
		start = false
	
	if start == true:
		going = true
		Music.play0()
		time -= delta
		rec()
		$CanvasLayer/SCORE1.visible = true
		$CanvasLayer/SCORE2.visible = true
		$CanvasLayer/TIME.visible = true
	else:
		if going == true:
			$rankz/AnimationPlayer.play("win")
			end()
		else:
			$rankz/R.visible = false
	$CanvasLayer/TIME.text = "TIME: " + str(timer)
	
	timer = int(round(time))
	
	vis()
	
	if progress == 6:
		progress = 0
	
	score()

func end():
	$targets.visible = false
	$targets/AnimationPlayer.stop()
	$targets2.visible = false
	$targets2/AnimationPlayer.stop()
	
	reset()
	
	MILK = false
	CEREAL = false
	COOKIES = false
	BREAD = false
	BUTTER = false
	TOAST = false
	CHEESE = false
	BACON = false
	ICECREAM = false
	APPLE = false
	
	$CanvasLayer/COLLECTING.visible = false
	$CanvasLayer/SCORE1.visible = false
	$CanvasLayer/SCORE2.visible = false
	$CanvasLayer/TIME.visible = false
	$CanvasLayer/RECIPE1.visible = false
	$CanvasLayer/RECIPE2.visible = false
	$CanvasLayer/RECIPE3.visible = false
	$CanvasLayer/RECIPE4.visible = false
	$CanvasLayer/RECIPE5.visible = false
	$CanvasLayer/RECIPE6.visible = false
	$CanvasLayer/ProgressBar.visible = false
	$CanvasLayer/MILK.visible = false
	$CanvasLayer/CEREAL.visible = false
	$CanvasLayer/MC.visible = false
	$CanvasLayer/COOKIES.visible = false
	$CanvasLayer/BC.visible = false
	$CanvasLayer/BREAD.visible = false
	$CanvasLayer/BUTTER.visible = false
	$CanvasLayer/TOAST.visible = false
	$CanvasLayer/TOASTB.visible = false
	$CanvasLayer/CHEESE.visible = false
	$CanvasLayer/BACON.visible = false
	$CanvasLayer/CHACON.visible = false
	$CanvasLayer/ICECREAM.visible = false
	$CanvasLayer/ICECREAMB.visible = false
	$CanvasLayer/APPLE.visible = false
	$CanvasLayer/APPLEJ.visible = false
	$CanvasLayer/READY.visible = false

func vis():
	if MILK == true:
		$CanvasLayer/MILK.visible = true
	else:
		$CanvasLayer/MILK.visible = false
	if CEREAL == true:
		$CanvasLayer/CEREAL.visible = true
	else:
		$CanvasLayer/CEREAL.visible = false
	if MC == true:
		$CanvasLayer/MC.visible = true
		$CanvasLayer/READY.visible = true
	else:
		$CanvasLayer/MC.visible = false
	if COOKIES == true:
		$CanvasLayer/COOKIES.visible = true
	else:
		$CanvasLayer/COOKIES.visible = false
	if BC == true:
		$CanvasLayer/BC.visible = true
		$CanvasLayer/READY.visible = true
	else:
		$CanvasLayer/BC.visible = false
	if BREAD == true:
		$CanvasLayer/BREAD.visible = true
	else:
		$CanvasLayer/BREAD.visible = false
	if BUTTER == true:
		$CanvasLayer/BUTTER.visible = true
	else:
		$CanvasLayer/BUTTER.visible = false
	if TOAST == true:
		$CanvasLayer/TOAST.visible = true
	else:
		$CanvasLayer/TOAST.visible = false
	if BT == true:
		$CanvasLayer/TOASTB.visible = true
		$CanvasLayer/READY.visible = true
	else:
		$CanvasLayer/TOASTB.visible = false
	if CHEESE == true:
		$CanvasLayer/CHEESE.visible = true
	else:
		$CanvasLayer/CHEESE.visible = false
	if BACON == true:
		$CanvasLayer/BACON.visible = true
	else:
		$CanvasLayer/BACON.visible = false
	if CB == true:
		$CanvasLayer/CHACON.visible = true
		$CanvasLayer/READY.visible = true
	else:
		$CanvasLayer/CHACON.visible = false
	if ICECREAM == true:
		$CanvasLayer/ICECREAM.visible = true
	else:
		$CanvasLayer/ICECREAM.visible = false
	if IC == true:
		$CanvasLayer/ICECREAMB.visible = true
		$CanvasLayer/READY.visible = true
	else:
		$CanvasLayer/ICECREAMB.visible = false
	if APPLE == true:
		$CanvasLayer/APPLE.visible = true
	else:
		$CanvasLayer/APPLE.visible = false
	if AJ == true:
		$CanvasLayer/APPLEJ.visible = true
		$CanvasLayer/READY.visible = true
	else:
		$CanvasLayer/APPLEJ.visible = false

func rec():
	if progress == 0:
		$CanvasLayer/RECIPE1.visible = true
		$CanvasLayer/RECIPE2.visible = false
		$CanvasLayer/RECIPE3.visible = false
		$CanvasLayer/RECIPE4.visible = false
		$CanvasLayer/RECIPE5.visible = false
		$CanvasLayer/RECIPE6.visible = false
	if progress == 1:
		$CanvasLayer/RECIPE1.visible = false
		$CanvasLayer/RECIPE2.visible = true
		$CanvasLayer/RECIPE3.visible = false
		$CanvasLayer/RECIPE4.visible = false
		$CanvasLayer/RECIPE5.visible = false
		$CanvasLayer/RECIPE6.visible = false
	if progress == 2:
		$CanvasLayer/RECIPE1.visible = false
		$CanvasLayer/RECIPE2.visible = false
		$CanvasLayer/RECIPE3.visible = true
		$CanvasLayer/RECIPE4.visible = false
		$CanvasLayer/RECIPE5.visible = false
		$CanvasLayer/RECIPE6.visible = false
	if progress == 3:
		$CanvasLayer/RECIPE1.visible = false
		$CanvasLayer/RECIPE2.visible = false
		$CanvasLayer/RECIPE3.visible = false
		$CanvasLayer/RECIPE4.visible = true
		$CanvasLayer/RECIPE5.visible = false
		$CanvasLayer/RECIPE6.visible = false
	if progress == 4:
		$CanvasLayer/RECIPE1.visible = false
		$CanvasLayer/RECIPE2.visible = false
		$CanvasLayer/RECIPE3.visible = false
		$CanvasLayer/RECIPE4.visible = false
		$CanvasLayer/RECIPE5.visible = true
		$CanvasLayer/RECIPE6.visible = false
	if progress == 5:
		$CanvasLayer/RECIPE1.visible = false
		$CanvasLayer/RECIPE2.visible = false
		$CanvasLayer/RECIPE3.visible = false
		$CanvasLayer/RECIPE4.visible = false
		$CanvasLayer/RECIPE5.visible = false
		$CanvasLayer/RECIPE6.visible = true

func check():
	if prepB == true:
		prep()
	
	if fridgeB == true:
		if progress == 0:
			if MC == false:
				MILK = true
		if progress == 1:
			if BC == false:
				COOKIES = true
		if progress == 2:
			if BT == false:
				BUTTER = true
		if progress == 5:
			if CB == false:
				if BACON == false:
					CHEESE = true
				if CHEESE == false:
					BACON = true
				if CHEESE == true:
					BACON = true
				if BACON == true:
					CHEESE = true
		if progress == 4:
			if IC == false:
				ICECREAM = true
		if progress == 3:
			if AJ == false:
				APPLE = true
	if cabinetB == true:
		if progress == 0:
			if MC == false:
				CEREAL = true
		if progress == 2:
			if TOAST == false:
				if BT == false:
					BREAD = true
	if ovenB == true:
		if progress == 1:
			if COOKIES == true:
				BC = true
				COOKIES = false
		if progress == 5:
			if CHEESE == true:
				if BACON == true:
					CB = true
					CHEESE = false
					BACON = false
		if progress == 4:
			if ICECREAM == true:
				IC = true
				ICECREAM = false
	if toastB == true:
		if progress == 2:
			if BREAD == true:
				TOAST = true
				BREAD = false
		if progress == 3:
			if APPLE == true:
				AJ = true
				APPLE = false
	
	reset()

func reset():
	Global.control = true
	collect = false
	$CanvasLayer/COLLECTING.visible = false
	$CanvasLayer/ProgressBar.visible = false
	fridgeA = false
	fridgeB = false
	cabinetA = false
	cabinetB = false
	ovenA = false
	ovenB = false
	toastA = false
	toastB = false
	prepA = false
	prepB = false


func prep():
	if MILK == true:
		if CEREAL == true:
			MC = true
			MILK = false
			CEREAL = false
	if TOAST == true:
		if BUTTER == true:
			BT = true
			TOAST = false
			BUTTER = false
	if CHEESE == true:
		if BACON == true:
			CB = true
			CHEESE = false
			BACON = false


func _on_serve_area_entered(area: Area) -> void:
	if area.is_in_group("int"):
		if MC == true:
			score1 = score1 + 20
			MC = false
			progress = progress + 1
			$CanvasLayer/READY.visible = false
		if BC == true:
			score1 = score1 + 20
			BC = false
			progress = progress + 1
			$CanvasLayer/READY.visible = false
		if BT == true:
			score1 = score1 + 20
			BT = false
			progress = progress + 1
			$CanvasLayer/READY.visible = false
		if CB == true:
			score1 = score1 + 20
			CB = false
			progress = progress + 1
			$CanvasLayer/READY.visible = false
		if IC == true:
			score1 = score1 + 20
			IC = false
			progress = progress + 1
			$CanvasLayer/READY.visible = false
		if AJ == true:
			score1 = score1 + 20
			AJ = false
			progress = progress + 1
			$CanvasLayer/READY.visible = false

func _on_prep_area_entered(area: Area) -> void:
	if area.is_in_group("int"):
		print("DINGY")
		if prepA == false:
			prepA = true
			prepB = false
			Global.control = false
			$prep/AnimationPlayer.play("start")
			$CanvasLayer/COLLECTING.visible = true
			$CanvasLayer/ProgressBar.visible = true
			collect = true
		if prepB == true:
			prepA = false
			prepB = false
			Global.control = true
			collect = false
			$CanvasLayer/COLLECTING.visible = false
			$CanvasLayer/ProgressBar.visible = false

func _on_prep2_animation_finished(anim_name: String) -> void:
	if anim_name == "start":
		prepB = true
		fridgeA = false
		fridgeB = false
		cabinetA = false
		cabinetB = false
		ovenA = false
		ovenB = false
		toastA = false
		toastB = false

func _on_fridge_area_entered(area: Area) -> void:
	if area.is_in_group("int"):
		print("DINGY")
		if fridgeA == false:
			fridgeA = true
			fridgeB = false
			Global.control = false
			$fridge/AnimationPlayer.play("start")
			$CanvasLayer/COLLECTING.visible = true
			$CanvasLayer/ProgressBar.visible = true
			collect = true
		if fridgeB == true:
			fridgeA = false
			fridgeB = false
			Global.control = true
			collect = false
			$CanvasLayer/COLLECTING.visible = false
			$CanvasLayer/ProgressBar.visible = false

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "start":
		fridgeB = true
		cabinetA = false
		cabinetB = false
		ovenA = false
		ovenB = false
		toastA = false
		toastB = false
		prepA = false
		prepB = false
	if anim_name == "win":
		$rankz/AnimationPlayer.play("end")
		going = false
		start = false
	if anim_name == "end":
		Global.control = true
		Global.cookdone = true
		$rankz/AnimationPlayer.play("end2")
	

func _on_cabinet_area_entered(area: Area) -> void:
	if area.is_in_group("int"):
		print("DINGY")
		if cabinetA == false:
			cabinetA = true
			cabinetB = false
			Global.control = false
			$cabinet/AnimationPlayer.play("start")
			$CanvasLayer/COLLECTING.visible = true
			$CanvasLayer/ProgressBar.visible = true
			collect = true
		if cabinetB == true:
			cabinetA = false
			cabinetB = false
			Global.control = true
			collect = false
			$CanvasLayer/COLLECTING.visible = false
			$CanvasLayer/ProgressBar.visible = false

func _on_cabinet2_animation_finished(anim_name: String) -> void:
	if anim_name == "start":
		cabinetB = true
		fridgeA = false
		fridgeB = false
		ovenA = false
		ovenB = false
		toastA = false
		toastB = false
		prepA = false
		prepB = false

func _on_oven_area_entered(area: Area) -> void:
	if area.is_in_group("int"):
		print("DINGY")
		if ovenA == false:
			ovenA = true
			ovenB = false
			Global.control = false
			$oven/AnimationPlayer.play("start")
			$CanvasLayer/COLLECTING.visible = true
			$CanvasLayer/ProgressBar.visible = true
			collect = true
		if ovenB == true:
			ovenA = false
			ovenB = false
			Global.control = true
			collect = false
			$CanvasLayer/COLLECTING.visible = false
			$CanvasLayer/ProgressBar.visible = false

func _on_oven2_animation_finished(anim_name: String) -> void:
	if anim_name == "start":
		ovenB = true
		fridgeA = false
		fridgeB = false
		cabinetA = false
		cabinetB = false
		toastA = false
		toastB = false
		prepA = false
		prepB = false

func _on_toaster_area_entered(area: Area) -> void:
	if area.is_in_group("int"):
		print("DINGY")
		if toastA == false:
			toastA = true
			toastB = false
			Global.control = false
			$toaster/AnimationPlayer.play("start")
			$CanvasLayer/COLLECTING.visible = true
			$CanvasLayer/ProgressBar.visible = true
			collect = true
		if toastB == true:
			toastA = false
			toastB = false
			Global.control = true
			collect = false
			$CanvasLayer/COLLECTING.visible = false
			$CanvasLayer/ProgressBar.visible = false

func _on_toaster2_animation_finished(anim_name: String) -> void:
	if anim_name == "start":
		toastB = true
		fridgeA = false
		fridgeB = false
		cabinetA = false
		cabinetB = false
		ovenA = false
		ovenB = false
		prepA = false
		prepB = false
