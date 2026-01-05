extends Control

signal yes_pressed
signal no_pressed
signal start_pressed

func _on_yes_pressed() -> void:
	yes_pressed.emit()

func _on_no_pressed() -> void:
	no_pressed.emit()

func _on_button_start_pressed() -> void:
	start_pressed.emit()
