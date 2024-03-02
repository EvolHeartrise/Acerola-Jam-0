extends Node

signal select_just_pressed

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("select"):
		select_just_pressed.emit()
