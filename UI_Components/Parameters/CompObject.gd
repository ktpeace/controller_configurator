extends BaseParameter
class_name CompObject

var _internals: Array[BaseParameter] = []
var _holder: VBoxContainer

func setup(property_name: StringName, description: StringName) -> void:
	base_setup(property_name, description)
	_holder = $Holder

func setup_internals(internals: Array[BaseParameter]) -> void:
	_internals = internals
	for interal in internals:
		_holder.add_child(interal)

func set_value(value: Variant) -> void:
	# This takes in an array
	for index in range(len(value)):
		_internals[index].set_value(value[index])

func get_value() -> Variant:
	var output: Array = []
	for internal in _internals:
		output.append(internal.get_value())
	return output

## OVERRIDDEN
func get_value_as_dict() -> Dictionary:
	var output: Dictionary = {}
	for internal in _internals:
		output.merge(internal.get_value_as_dict())
	return {name: output}
