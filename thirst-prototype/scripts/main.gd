extends Node

var food_data = {}
var stomach: int = 50
var water: int = 50
var mental: int = 50
var fd = load("res://food_parameter.json").get_data()

func _ready():
	randomize()
	$Control/death_image.hide()
	$Control/Label_death.hide()
	$Control/Button_start.hide()
	load_next()

func load_next():
	var n = fd.keys().pick_random()
	$Control/food_image.texture = load("res://assets/Game-icons.net/" + n + ".png")
	$Control/food_name.text = n
	$Control/percentage.text = str(fd[n][3])
	for a in range(0, 3):
		$Control/VBox_parameter.get_child(a).text = str(fd[n][a])

func yes():
	var n = $Control/food_name.text
	stomach += int(fd[n][0])
	water += int(fd[n][1])
	mental += int(fd[n][2])
	$Control/H_Label_stomach.text = str(stomach)
	$Control/H_Label_water.text = str(water)
	$Control/H_Label_mental.text = str(mental)
	if randi() % 100 < float($Control/percentage.text) or stomach < 0 or water < 0 or mental < 0:
		game_over()
	else:
		load_next()

func no():
	stomach -= 10
	water -= 10
	mental -= 10
	$Control/H_Label_stomach.text = str(stomach)
	$Control/H_Label_water.text = str(water)
	$Control/H_Label_mental.text = str(mental)
	if stomach < 0 or water < 0 or mental < 0:
		game_over()
	else:
		load_next()
		
func game_over():
	$Control/death_image.show()
	$Control/Label_death.show()
	$Control/yes.hide()
	$Control/no.hide()
	await get_tree().create_timer(2.0).timeout
	$Control/Button_start.show()
	
func new_game():
	$Control/death_image.hide()
	$Control/Label_death.hide()
	$Control/Button_start.hide()
	$Control/yes.show()
	$Control/no.show()
	stomach = 50
	water = 50
	mental = 50
	$Control/H_Label_stomach.text = str(stomach)
	$Control/H_Label_water.text = str(water)
	$Control/H_Label_mental.text = str(mental)
	load_next()
