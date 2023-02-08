extends Control

onready var show_fps = get_node("label")

func _ready() -> void:
	Gui.connect("update_display_fps", self, "_on_update_display_fps")

func _process(delta: float) -> void:
	if not Gui.display_fps: return
	show_fps.text = String(Engine.get_frames_per_second())

func _on_update_display_fps() -> void:
	show_fps.visible = Gui.display_fps
