@tool
class_name NPC
extends Node3D

#const CHARACTER_SKIN_MATERIAL: StandardMaterial3D = preload("res://assets/materials/character_skin_material.tres")

@onready var body: Node3D = %Body

@export var skin_tone: Color = Color.WHITE :
	set(value):
		skin_tone = value
		set_skin_tone(skin_tone)

func _ready():
	set_skin_tone(skin_tone)

func set_skin_tone(skin_tone: Color) -> void:
	if body == null:
		return
	for child: Node in body.get_children():
		if child is MeshInstance3D:
			var material: StandardMaterial3D = child.get_surface_override_material(0)
			material.albedo_color = skin_tone
