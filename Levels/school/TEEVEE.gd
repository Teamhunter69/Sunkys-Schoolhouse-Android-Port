extends Sprite3D

var rng = RandomNumberGenerator.new()

var luck

var switch = false

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("game")



func _process(_delta: float) -> void:
	if switch == true:
		rng.randomize()
		luck = rng.randi_range(1, 68)
		switch = false
	
	if luck == 1:
		texture = load("res://GAMERZ/001.png")
	if luck == 2:
		texture = load("res://GAMERZ/002.png")
	if luck == 3:
		texture = load("res://GAMERZ/003.png")
	if luck == 4:
		texture = load("res://GAMERZ/004.png")
	if luck == 5:
		texture = load("res://GAMERZ/005.png")
	if luck == 6:
		texture = load("res://GAMERZ/006.png")
	if luck == 7:
		texture = load("res://GAMERZ/007.png")
	if luck == 8:
		texture = load("res://GAMERZ/008.png")
	if luck == 9:
		texture = load("res://GAMERZ/009.png")
	if luck == 10:
		texture = load("res://GAMERZ/010.png")
	if luck == 11:
		texture = load("res://GAMERZ/011.png")
	if luck == 12:
		texture = load("res://GAMERZ/012.png")
	if luck == 13:
		texture = load("res://GAMERZ/013.png")
	if luck == 14:
		texture = load("res://GAMERZ/014.png")
	if luck == 15:
		texture = load("res://GAMERZ/015.png")
	if luck == 16:
		texture = load("res://GAMERZ/016.png")
	if luck == 17:
		texture = load("res://GAMERZ/017.png")
	if luck == 18:
		texture = load("res://GAMERZ/018.png")
	if luck == 19:
		texture = load("res://GAMERZ/019.png")
	if luck == 20:
		texture = load("res://GAMERZ/020.png")
	if luck == 21:
		texture = load("res://GAMERZ/021.png")
	if luck == 22:
		texture = load("res://GAMERZ/022.png")
	if luck == 23:
		texture = load("res://GAMERZ/023.png")
	if luck == 24:
		texture = load("res://GAMERZ/024.png")
	if luck == 25:
		texture = load("res://GAMERZ/025.png")
	if luck == 26:
		texture = load("res://GAMERZ/026.png")
	if luck == 27:
		texture = load("res://GAMERZ/027.png")
	if luck == 28:
		texture = load("res://GAMERZ/028.png")
	if luck == 29:
		texture = load("res://GAMERZ/029.png")
	if luck == 30:
		texture = load("res://GAMERZ/030.png")
	if luck == 31:
		texture = load("res://GAMERZ/031.png")
	if luck == 32:
		texture = load("res://GAMERZ/032.png")
	if luck == 33:
		texture = load("res://GAMERZ/033.png")
	if luck == 34:
		texture = load("res://GAMERZ/034.png")
	if luck == 35:
		texture = load("res://GAMERZ/035.png")
	if luck == 36:
		texture = load("res://GAMERZ/036.png")
	if luck == 37:
		texture = load("res://GAMERZ/037.png")
	if luck == 38:
		texture = load("res://GAMERZ/038.png")
	if luck == 39:
		texture = load("res://GAMERZ/039.png")
	if luck == 40:
		texture = load("res://GAMERZ/040.png")
	if luck == 41:
		texture = load("res://GAMERZ/041.png")
	if luck == 42:
		texture = load("res://GAMERZ/042.png")
	if luck == 43:
		texture = load("res://GAMERZ/043.png")
	if luck == 44:
		texture = load("res://GAMERZ/044.png")
	if luck == 45:
		texture = load("res://GAMERZ/045.png")
	if luck == 46:
		texture = load("res://GAMERZ/046.png")
	if luck == 47:
		texture = load("res://GAMERZ/047.png")
	if luck == 48:
		texture = load("res://GAMERZ/048.png")
	if luck == 49:
		texture = load("res://GAMERZ/049.png")
	if luck == 50:
		texture = load("res://GAMERZ/050.png")
	if luck == 51:
		texture = load("res://GAMERZ/051.png")
	if luck == 52:
		texture = load("res://GAMERZ/052.png")
	if luck == 53:
		texture = load("res://GAMERZ/053.png")
	if luck == 54:
		texture = load("res://GAMERZ/054.png")
	if luck == 55:
		texture = load("res://GAMERZ/055.png")
	if luck == 56:
		texture = load("res://GAMERZ/056.png")
	if luck == 57:
		texture = load("res://GAMERZ/057.png")
	if luck == 58:
		texture = load("res://GAMERZ/058.png")
	if luck == 59:
		texture = load("res://GAMERZ/059.png")
	if luck == 60:
		texture = load("res://GAMERZ/060.png")
	if luck == 61:
		texture = load("res://GAMERZ/061.png")
	if luck == 62:
		texture = load("res://GAMERZ/062.png")
	if luck == 63:
		texture = load("res://GAMERZ/063.png")
	if luck == 64:
		texture = load("res://GAMERZ/064.png")
	if luck == 65:
		texture = load("res://GAMERZ/065.png")
	if luck == 66:
		texture = load("res://GAMERZ/066.png")
	if luck == 67:
		texture = load("res://GAMERZ/065.png")
	if luck == 68:
		texture = load("res://GAMERZ/066.png")



func _on_AnimationPlayer_animation_finished(_anim_name: String) -> void:
	switch = true
	$AnimationPlayer.play("game")
