extends State

onready var _animation_player: AnimationPlayer = get_node("AnimationPlayer")


func enter():
	_animation_player.play("Jump")


func _on_AnimationPlayer_animation_finished(_anim_name: String):
	owner.emit_signal("end_turn")
