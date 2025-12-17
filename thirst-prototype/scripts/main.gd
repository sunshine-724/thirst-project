extends Node

var scenario = {}
var current_scene = "scene_1"
var affection = {"heroine": 0}

func _ready():
	scenario = load("res://data/scenario.json").get_data()
	load_scene(current_scene)

func load_scene(scene_name):
	current_scene = scene_name
	var sc = scenario[scene_name]

	# テキスト表示
	$"../TextBox".text = sc.text

	# 選択肢を表示


func _on_choice_pressed(choice):
	# パラメータ変動
	for k in choice.affection.keys():
		affection[k] += choice.affection[k]

#次のシーンへ
