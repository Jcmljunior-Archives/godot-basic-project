extends Control

onready var title = get_node("content/grid/title")
onready var display_fps = get_node("content/grid/tab_container/Video/content/grid/vbox/display_fps")
onready var master_volume = get_node("content/grid/tab_container/Audio/content/grid/vbox/label")
onready var volume_min = get_node("content/grid/tab_container/Audio/content/grid/vbox/hbox/volume_min")
onready var volume_max = get_node("content/grid/tab_container/Audio/content/grid/vbox/hbox/volume_max")

func _ready() -> void:
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

