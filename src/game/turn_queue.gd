class_name TurnQueue
extends Object

var entities: Array setget set_entities
var _active_entity: Entity


func start_next_turn():
	if _active_entity != null:
		_active_entity.disconnect("end_turn", self, "_on_active_entity_end_turn")
		entities.push_back(_active_entity)

	_active_entity = entities.pop_front()
	_active_entity.connect("end_turn", self, "_on_active_entity_end_turn")
	_active_entity.emit_signal("start_turn")


func set_entities(to_entities: Array):
	entities = to_entities
	entities.sort_custom(self, "_sort_entities")


# sort in desc order by Stats/Initiative value
func _sort_entities(a: Entity, b: Entity):
	return a.get_stat("Initiative").value > b.get_stat("Initiative").value


func _on_active_entity_end_turn():
	start_next_turn()
