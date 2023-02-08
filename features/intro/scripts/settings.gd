extends Control

onready var container: TabContainer = $content/grid/container
onready var checkbox_display_fps: CheckBox = $content/grid/container/video/grid_video/hbox_display_fps/button_display_fps/check_box
onready var button_video: Button = $content/grid/hmenu/button_video
onready var button_audio: Button = $content/grid/hmenu/button_audio

# SUPORTE A TRADUÇÃO DE ELEMENTOS.
onready var nav_title: Label = $content/grid/navigation/title
onready var button_display_fps: Button = $content/grid/container/video/grid_video/hbox_display_fps/button_display_fps

# INICIALIZAÇÃO DE PRÉ-CONFIGURADOS.
# SELEÇÃO DO BOTÃO DE VÍDEO.
func _ready() -> void:
	checkbox_display_fps.pressed = Gui.display_fps
	button_video.grab_focus()
	_update_locales()


# INICIALIZAÇÃO DE TRADUÇÕES.
func _update_locales() -> void:
	nav_title.text = tr("INTRO_DISPLAY_SETTINGS_TITLE")
	button_display_fps.text = tr("INTRO_CONTENT_MENU_DISPLAY_FPS")
	button_video.text = tr("INTRO_MENU_VIDEO")
	button_audio.text = tr("INTRO_MENU_AUDIO")


# ENTRA NA ABA DE AJUSTE DE VÍDEO.
func _on_button_video_pressed() -> void:
	container.current_tab = 0

# ENTRA NA ABA DE AJUSTE DE ÁUDIO.
func _on_button_audio_pressed() -> void:
	container.current_tab = 1

# ATUALIZAÇÃO DO ESTADO DE EXIBIÇÃO DE FPS.
func _on_button_display_fps_pressed() -> void:
	Gui.update_display_fps()
	checkbox_display_fps.pressed = Gui.display_fps

# RETORNA A TELA INICIAL.
func _on_button_previous_pressed() -> void:
	assert(ResourceLoader.exists("res://features/intro/scenes/sce_start_game.tscn"))
	get_tree().change_scene("res://features/intro/scenes/sce_start_game.tscn")
