class_name FlyingArrow
extends Node3D

signal collided(node: Node3D)

@onready var area: Area3D = %Area3D

func _ready() -> void:
	area.body_entered.connect(func(node: Node3D):
		collided.emit(node)
	)

func explode() -> void:
	#TODO: Plays the heart explosion particle animation and then queue_free's itself
	queue_free()
