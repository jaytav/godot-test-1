extends Stat

export var min_value: int
export var max_value: int


func _ready() -> void:
	if !initial_value:
		value = max_value


func set_value(to_value: int) -> void:
	.set_value(clamp(to_value, min_value, max_value))
