extends Node2D

var fly_scene = preload("res://src/Actors/Test Enemy.tscn") #not actually the fly enemy
var enemy_scene =  preload("res://Enemies/Knight.tscn")
var archer_scene = preload("res://Enemies/Archer.tscn")
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

