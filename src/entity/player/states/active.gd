extends State

onready var _highlight_animation_player: AnimationPlayer = owner.get_node("Highlight/AnimationPlayer")


func unhandled_input(event):
    # press space to end turn
    if event.is_action_pressed("ui_select"):
        owner.emit_signal("end_turn")
