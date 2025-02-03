@tool
class_name GodotPlushieViewportPetPlugin
extends EditorPlugin

var godot_plushie: AnimatedSprite2D

func _enter_tree() -> void:
	if not Engine.is_editor_hint():
		return
	var viewport_container := EditorInterface.get_editor_viewport_2d().get_parent()
	if not is_instance_valid(viewport_container):
		printerr("Godot Plushie Viewport Pet couldn't find the EditorViewportContainer")
		return
	godot_plushie = preload("res://addons/godot_plushie_viewport_pet/godot_plushie.tscn").instantiate()
	godot_plushie.viewport_container = viewport_container
	viewport_container.add_child(godot_plushie)

func _exit_tree() -> void:
	if is_instance_valid(godot_plushie):
		godot_plushie.queue_free()

func _input(event: InputEvent) -> void:
	if is_instance_valid(godot_plushie):
		godot_plushie._input(event)