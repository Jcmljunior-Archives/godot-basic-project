extends Control

onready var title: Label = get_node("content/grid/hbox/title")
onready var display_fps: Label = get_node("content/grid/tab_container/Video/content/grid/vbox/display_fps")
onready var check_display_fps: CheckButton = get_node("content/grid/tab_container/Video/content/grid/vbox/check")
onready var master_volume: Label = get_node("content/grid/tab_container/Audio/content/grid/vbox/label")
onready var volume_min: Label = get_node("content/grid/tab_container/Audio/content/grid/vbox/hbox/volume_min")
onready var volume_max: Label = get_node("content/grid/tab_container/Audio/content/grid/vbox/hbox/volume_max")

func _ready() -> void:
	check_display_fps.pressed = Gui.display_fps
	
	update_locale()

# INICIALIZAÇÃO DA TRADUÇÃO DE ELEMENTOS.
func update_locale() -> void:
	title.text = tr("INTRO_DISPLAY_SETTINGS_TITLE")
	display_fps.text = tr("INTRO_CONTENT_MENU_DISPLAY_FPS")
	master_volume.text = tr("INTRO_CONTENT_MENU_MASTER_VOLUME")
	volume_min.text = tr("INTRO_CONTENT_MENU_VOLUME_MIN")
	volume_max.text = tr("INTRO_CONTENT_MENU_VOLUME_MAX")

func _on_check_pressed() -> void:
	Gui.update_display_fps()


func _on_button_back_pressed() -> void:
	get_tree().change_scene("res://features/intro/scenes/sce_start_game.tscn")
