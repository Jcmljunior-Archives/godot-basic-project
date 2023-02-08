extends Control

export (PackedScene) var next_scene: PackedScene
export (PackedScene) var settings_scene: PackedScene

onready var vmenu: VBoxContainer = get_node("content/vmenu")
onready var logo: Label = get_node("content/logo")
onready var button_start: Button = get_node("content/vmenu/button_start")
onready var button_settings: Button = get_node("content/vmenu/button_settings")
onready var button_exit: Button = get_node("content/vmenu/button_exit")


func _ready() -> void:
	update_locale()
	align_center_vmenu(vmenu.get_minimum_size())	
	button_start.grab_focus()


# INICIALIZAÇÃO DA TRADUÇÃO DE ELEMENTOS.
func update_locale() -> void:
	logo.text = tr("INTRO_DISPLAY_PROJECT")
	button_start.text = tr("INTRO_BUTTON_START_GAME")
	button_settings.text = tr("INTRO_BUTTON_SETTINGS")
	button_exit.text = tr("INTRO_BUTTON_EXIT")

# CENTRALIZAÇÃO DO MENU PRINCIPAL.
func align_center_vmenu(size: Vector2) -> void:
	vmenu.anchor_top = 0.5
	vmenu.anchor_bottom = 0.5
	vmenu.anchor_right = 0.5
	vmenu.anchor_left = 0.5
	
	vmenu.margin_top = -size.y / 2
	vmenu.margin_bottom = -size.y / 2
	vmenu.margin_right = -size.x / 2
	vmenu.margin_left = -size.x / 2


func _on_button_start_pressed() -> void:
	assert(next_scene.can_instance())
	get_tree().change_scene_to(next_scene)


func _on_button_settings_pressed() -> void:
	assert(settings_scene.can_instance())
	get_tree().change_scene_to(settings_scene)


func _on_button_exit_pressed() -> void:
	get_tree().quit()
