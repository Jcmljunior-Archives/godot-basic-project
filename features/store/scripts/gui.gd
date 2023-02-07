extends Node

var display_fps := true
var display_mode := 0

signal update_display_fps
signal update_display_mode

func update_display_fps() -> void:
	display_fps = !display_fps
	emit_signal("update_display_fps")

func update_display_mode(index: int) -> void:
	display_mode = index
	emit_signal("update_display_mode")
