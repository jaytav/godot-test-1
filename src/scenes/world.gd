extends Node2D


func _ready():
    var turn_queue: TurnQueue = TurnQueue.new()
    turn_queue.entities = get_node("Entities").get_children()
    turn_queue.start_next_turn()
