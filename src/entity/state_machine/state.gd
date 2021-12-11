class_name State
extends Node

var state_machine: StateMachine


func _ready():
	state_machine = get_parent()


func enter():
	# implement what happens when entering state
	pass


func exit():
	# implement what happens when exiting state
	pass


func process(delta):
	# implement what happens in StateMachine._process(delta)
	pass


func physics_process(delta):
	# implement what happens in StateMachine._physics_process(delta)
	pass


func unhandled_input(event):
	# implement what happens in StateMachine._unhandled_input(event)
	pass
