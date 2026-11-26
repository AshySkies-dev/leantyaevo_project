extends CanvasLayer


func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	pass


func _on_roll_die_button_pressed() -> void:
	var roll_result = randi_range(1, 6)
	$RollDieButton.hide()
	$RollResult.text = str(roll_result)
	await get_tree().create_timer(3).timeout
	$RollDieButton.show()
