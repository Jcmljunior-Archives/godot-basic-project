extends Control

export (PackedScene) var next_scene: PackedScene

onready var animation: AnimationPlayer = $background/animation
onready var timer: Timer = $timer
onready var audio: AudioStreamPlayer = $audio

# APÓS O TEMPORIZADOR TERMINAR, INICIA-SE A ANIMAÇÃO DE TRANSIÇÃO.
func _on_timer_timeout() -> void:
	animation.play("transition_in")


# APÓS O TERMINO DA ANIMAÇÃO DO PLANO DE FUNDO, MUDA O CENÁRIO.
func _on_background_animation_finished(anim_name: String) -> void:
	if not anim_name == "transition_in": return
	assert(next_scene.can_instance())
	get_tree().change_scene_to(next_scene)


# APÓS FINALIZAÇÃO DO EFEITO SONORO, O TEMPORIZADOR DE TRANSIÇÃO É INICIADO.
func _on_audio_finished() -> void:
	timer.start()

# APÓS A FINALIZAÇÃO DA ANIMAÇÃO DA LOGO, TOCA O EFEITO SONORO.
func _on_logo_animation_finished(anim_name: String) -> void:
	if not anim_name == "default": return
	audio.play()
