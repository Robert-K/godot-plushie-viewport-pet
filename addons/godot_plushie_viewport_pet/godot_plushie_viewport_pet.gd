@tool
class_name GodotPlushieViewportPetPlugin
extends EditorPlugin

var godot_plushie: AnimatedSprite2D

func _enter_tree() -> void:
	if not Engine.is_editor_hint():
		return
	godot_plushie = preload("res://addons/godot_plushie_viewport_pet/godot_plushie.tscn").instantiate()
	var main_screen = get_editor_interface().get_editor_main_screen()
	godot_plushie.main_screen = main_screen
	main_screen.add_child(godot_plushie)

func _exit_tree() -> void:
	if is_instance_valid(godot_plushie):
		godot_plushie.queue_free()

func _input(event: InputEvent) -> void:
	if is_instance_valid(godot_plushie):
		godot_plushie._input(event)