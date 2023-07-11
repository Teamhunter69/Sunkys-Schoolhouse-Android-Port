extends Area



func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	#print(Global.inclass)
	room()


func _on_Area_body_entered(body: Node) -> void:
	if body.name == "Player":
		Global.inclass = true
	if self.name == "class1":
		if body.name == "Player":
			Global.class1 = true
	if self.name == "class2":
		if body.name == "Player":
			Global.class2 = true
	if self.name == "class3":
		if body.name == "Player":
			Global.class3 = true
	if self.name == "class4":
		if body.name == "Player":
			Global.class4 = true
	if self.name == "class5":
		if body.name == "Player":
			Global.class5 = true
	if self.name == "class6":
		if body.name == "Player":
			Global.class6 = true
	if self.name == "class7":
		if body.name == "Player":
			Global.class7 = true
	if self.name == "class8":
		if body.name == "Player":
			Global.class8 = true
	if self.name == "fac1":
		if body.name == "Player":
			Global.fac1 = true
	if self.name == "fac2":
		if body.name == "Player":
			Global.fac2 = true
	if self.name == "fac3":
		if body.name == "Player":
			Global.fac3 = true
	if self.name == "fac4":
		if body.name == "Player":
			Global.fac4 = true
	if self.name == "fac5":
		if body.name == "Player":
			Global.fac5 = true
	

func _on_Area_body_exited(body: Node) -> void:
	if body.name == "Player":
		Global.inclass = false
	if self.name == "class1":
		if body.name == "Player":
			Global.class1 = false
	if self.name == "class2":
		if body.name == "Player":
			Global.class2 = false
	if self.name == "class3":
		if body.name == "Player":
			Global.class3 = false
	if self.name == "class4":
		if body.name == "Player":
			Global.class4 = false
	if self.name == "class5":
		if body.name == "Player":
			Global.class5 = false
	if self.name == "class6":
		if body.name == "Player":
			Global.class6 = false
	if self.name == "class7":
		if body.name == "Player":
			Global.class7 = false
	if self.name == "class8":
		if body.name == "Player":
			Global.class8 = false
	if self.name == "fac1":
		if body.name == "Player":
			Global.fac1 = false
	if self.name == "fac2":
		if body.name == "Player":
			Global.fac2 = false
	if self.name == "fac3":
		if body.name == "Player":
			Global.fac3 = false
	if self.name == "fac4":
		if body.name == "Player":
			Global.fac4 = false
	if self.name == "fac5":
		if body.name == "Player":
			Global.fac5 = false

func room():
	if Global.class1 == true:
		Global.room = "class1"
	elif Global.class2 == true:
		Global.room = "class2"
	elif Global.class3 == true:
		Global.room = "class3"
	elif Global.class4 == true:
		Global.room = "class4"
	elif Global.class5 == true:
		Global.room = "class5"
	elif Global.class6 == true:
		Global.room = "class6"
	elif Global.class7 == true:
		Global.room = "class7"
	elif Global.class8 == true:
		Global.room = "class8"
	elif Global.fac1 == true:
		Global.room = "fac1"
	elif Global.fac2 == true:
		Global.room = "fac2"
	elif Global.fac3 == true:
		Global.room = "fac3"
	elif Global.fac4 == true:
		Global.room = "fac4"
	elif Global.fac5 == true:
		Global.room = "fac5"
	else:
		Global.room = "hallway"
