extends Node2D

var fly_scene = preload("res://src/Actors/FlyEnemy.tscn")
var enemy_scene =  preload("res://src/Actors/Enemy.tscn")
var archer_scene = preload("res://src/Actors/FlyEnemy.tscn")
var NewEnemy


func _ready():
	randomize()
	if randi()%6 <= 1:
		NewEnemy = fly_scene.instance()
		add_child(NewEnemy)
	elif randi()%6 <= 3:
		NewEnemy = enemy_scene.instance()
		add_child(NewEnemy)
	elif randi()%6 <= 5:
		NewEnemy = archer_scene.instance()
		add_child(NewEnemy)

