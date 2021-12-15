class_name Entity
extends Node2D

signal start_turn
signal end_turn

onready var _state_machine: StateMachine = get_node("StateMachine")
onready var _highlight: Sprite = get_node("Highlight")
onready var _highlight_animation_player: AnimationPlayer = get_node("Highlight/AnimationPlayer")


func get_stat(stat: String):
	return get_node("Stats/%s" % stat)


func _on_Entity_start_turn():
	_state_machine.transition_to("Active")
	_highlight_animation_player.play("Float")


func _on_Entity_end_turn():
	_state_machine.transition_to("Idle")
	_highlight_animation_player.stop()
	_highlight.visible = false
