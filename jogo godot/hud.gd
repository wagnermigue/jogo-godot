extends CanvasLayer

signal start_game
@onready var message_label = $Control/messageLabel
@onready var message_timer = $messageTimer
@onready var start_button = $Control/startButton
@onready var score_label = $Control/scoreLabel

func show_message(text):
	message_label.text = text
	message_label.show()
	message_timer.start()
	
func show_game_over():
	show_message("Game Over")
	await message_timer.timeout
	
	message_label.text = "Dodge The Bugs"
	message_label.show()
	
	await  get_tree().create_timer(1.0).timeout
	start_button.show()
	
	
func update_score(score):
	score_label.text = str(score)
	

func _on_start_button_pressed():
	start_button.hide()
	start_game.emit()
	


func _on_message_timer_timeout():
	message_label.hide()
