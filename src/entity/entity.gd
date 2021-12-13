class_name Entity
extends Node2D

signal start_turn
signal end_turn

onready var _state_machine: StateMachine = get_node("StateMachine")


func get_stat(stat: String):
    return get_node("Stats/%s" % stat)


func _on_Entity_start_turn():
    _state_machine.transition_to("Active")


func _on_Entity_end_turn():
    _state_machine.transition_to("Idle")
