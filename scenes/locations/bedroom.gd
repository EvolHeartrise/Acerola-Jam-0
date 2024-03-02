extends Node3D

@onready var animation_player: AnimationPlayer = %OpeningSequence

func start_opening_sequence() -> void:
	var animation_library: AnimationLibrary = animation_player.get_animation_library("")
	var animation_list: Array[StringName] = animation_library.get_animation_list()
	print(animation_list)
	for animation_name: StringName in animation_list:
		animation_player.play(animation_name)
		if animation_name.contains("Autoplay"):
			await animation_player.animation_finished
		else:
			await TextBox.finished_typing
			await InputManager.select_just_pressed

func _ready() -> void:
	start_opening_sequence()

## To be called by the AnimationPlayer
func textbox(text: String) -> void:
	TextBox.type_text(text)
