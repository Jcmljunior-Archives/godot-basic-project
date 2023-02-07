extends Control

export (PackedScene) var next_scene: PackedScene

onready var animation = get_node("background/animation")

func _on_logo_animation_finished(anim_name: String) -> void:
	if anim_name == "transition_in":
		animation.play("transition_in")


func _on_background_animation_finished(anim_name: String) -> void:
	if anim_name == "transition_in":
		assert(next_scene.can_instance())
		get_tree().change_scene_to(next_scene)
