@tool
class_name CharacterVisuals
extends Node3D

@onready var body: Node3D = %Body
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var animation_tree: AnimationTree = %AnimationTree

@export var skin_tone: Color = Color.WHITE :
	set(value):
		skin_tone = value
		set_skin_tone_material()

func _ready():
	set_skin_tone_material()
	if not Engine.is_editor_hint():
		animation_tree.active = true

func set_skin_tone_material() -> void:
	if body == null:
		return
	for child: Node in body.get_children():
		if child is MeshInstance3D:
			var material: StandardMaterial3D = child.get_surface_override_material(0)
			material.albedo_color = skin_tone

func _process(_delta: float):
	if owner is CharacterBody3D:
		if abs(owner.velocity.x) > 0 or abs(owner.velocity.z) > 0:
			animation_tree['parameters/conditions/is_idle'] = false
			animation_tree['parameters/conditions/is_walking'] = true
		else:
			animation_tree['parameters/conditions/is_idle'] = true
			animation_tree['parameters/conditions/is_walking'] = false
