extends Control

signal finished_typing

const DURATION_PER_CHARACTER: float = 0.02

@onready var label: RichTextLabel = %RichTextLabel

func type_text(text: String) -> void:
	label.text = text
	label.visible_ratio = 0
	var tween: Tween = create_tween()
	tween.tween_property(label, "visible_ratio", 1, text.length() * DURATION_PER_CHARACTER)
	await tween.finished
	finished_typing.emit()
	
