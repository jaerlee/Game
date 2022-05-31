extends Node2D

var archer_scene = preload("res://Enemies/Archer.tscn")
var NewEnemy


func _ready():
	NewEnemy = archer_scene.instance()
	add_child(NewEnemy)

