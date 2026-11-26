extends CanvasLayer

signal dice_roll
@onready var hint_pop_up: Window = $HintPopUp

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	pass


func _on_roll_die_button_pressed() -> void:
	var roll_result = randi_range(1, 6)
	$RollDieButton.hide()
	$RollResult.text = str(roll_result)
	dice_roll.emit(roll_result)
	await get_tree().create_timer(3).timeout
	$RollDieButton.show()


func _on_hint_button_pressed() -> void:
	$HintPopUp.show()


func _on_hint_pop_up_close_requested() -> void:
	$HintPopUp.hide()

func update_loop_count(loop_count: int):
	$PlayerStats.text = "Пройдено кругов: " + str(loop_count) + "\nЗаработанные баллы: -"
