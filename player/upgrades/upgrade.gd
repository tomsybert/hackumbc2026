extends Node
class_name Upgrade

var has_update : bool = false
var manager : UpgradeManager

func Ready() -> void:
	pass

@warning_ignore("unused_parameter")
func Update(delta:float) -> void:
	pass
