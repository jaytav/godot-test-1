extends State

func unhandled_input(event):
    # press space to end turn
    if event.is_action_pressed("ui_select"):
        owner.emit_signal("end_turn")
