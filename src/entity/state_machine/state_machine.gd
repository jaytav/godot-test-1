class_name StateMachine
extends Node

signal transitioned(from_state, to_state)

export var _initial_state: NodePath

var _state


func _ready():
	assert(!_initial_state.is_empty(), "%s _intitial_state must be set" % owner.name)

	_state = get_node(_initial_state)
	_state.enter()
	emit_signal("transitioned", null, _state)


func _process(delta):
	_state.process(delta)


func _physics_process(delta):
	_state.physics_process(delta)


func _unhandled_input(event):
	_state.unhandled_input(event)


func _transition_to(state_path: String):
	var state = get_node(state_path)

	if state == null:
		return print("%s state does not exist (%s)" % [owner.name, state_path])

	var from_state = _state
	_state.exit()
	_state = state
	_state.enter()

	emit_signal("transitioned", from_state, _state)


func _on_StateMachine_transitioned(from_state, to_state):
	if from_state == null:
		print("%s transitioned to %s" % [owner.name, to_state.name])
	else:
		print("%s transitioned from %s to %s" % [owner.name, from_state.name, to_state.name])
