extends Node2D

@export var cells = [0, 0, 0, 0, 0, 0, 0, 0, 0]


var score = Global.score
var flag = 0
var playerTurn = 1
# Called when the node enters the scene tree for the first time.

func reset():
	$Board/Square.hideSprites()
	$Board/Square2.hideSprites()
	$Board/Square3.hideSprites()
	$Board/Square4.hideSprites()
	$Board/Square5.hideSprites()
	$Board/Square6.hideSprites()
	$Board/Square7.hideSprites()
	$Board/Square8.hideSprites()
	$Board/Square9.hideSprites()
	cells = [0, 0, 0, 0, 0, 0, 0, 0, 0]
	flag = 0
	playerTurn = 1
	$WB.set_size(Vector2(458, 8))
	$WB.set_position(Vector2(55, 480))
	$WB.rotation_degrees = 0
	$WB.pivot_offset = Vector2(0, 0)
	$WB/WinBar.visible =  false
	$Label2.visible = false
	$GameMenu.visible = false

func _ready():
	reset()
	$Label.text = "Blue - Red\n{0}   :   {1}".format([str(score[0]), str(score[1])], "{_}")
	pass # Replace with function body.

func _notification(what):
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		_on_Back_Pressed()
func _on_Back_Pressed():
	reset()
	get_tree().change_scene_to_file("res://Scenes/node_2d.tscn")


func checkWin():
	for i in [1, 2]:
		if cells[0] == i and cells[1] == i and cells[2] == i:
			print("Player " , i , " wins")
			return [i, 0]
		elif cells[3] == i and cells[4] == i and cells[5] == i:
			print("Player " , i , " wins")
			return [i, 1]
		elif cells[6] == i and cells[7] == i and cells[8] == i:
			print("Player " , i , " wins")
			return [i, 2]
		elif cells[0] == i and cells[3] == i and cells[6] == i:
			print("Player " , i , " wins")
			return [i, 3]
		elif cells[1] == i and cells[4] == i and cells[7] == i:
			print("Player " , i , " wins")
			return [i, 4]
		elif cells[2] == i and cells[5] == i and cells[8] == i:
			print("Player " , i , " wins")
			return [i, 5]
		elif cells[0] == i and cells[4] == i and cells[8] == i:
			print("Player " , i , " wins")
			return [i, 6]
		elif cells[2] == i and cells[4] == i and cells[6] == i:
			print("Player " , i , " wins")
			return [i, 7]
		elif cells.count(0) == 0:
			return -1
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if flag == 1:
		$Label.text = "Blue - Red\n{0}   :   {1}".format([str(score[0]), str(score[1])], "{_}")
		$GameMenu.visible = true
		if Input.get_action_strength("exit"):
			reset()
			score = [0, 0]
			get_tree().change_scene_to_file("res://Scenes/node_2d.tscn")
		elif Input.get_action_strength("replay"):
			reset()
			get_tree().change_scene_to_file("res://Scenes/game_scene_1.tscn")
			# score = sc
	if flag == 0:
		var win = checkWin()
		if typeof(win) != typeof([1, 2]) and win == -1:
			print("tie")
			$Label2.visible = true
			$Label2.text = "It's a Tie!"
			flag = 1
			score[0] += 0.5
			score[1] += 0.5
		elif typeof(win) == typeof([1, 2]):
			$Label2.visible = true
			$Label2.text = "Player " + str(win[0]) + " Wins!"
			print("Win Type: ", win[1])
			score[win[0]-1] += 1
			flag = 1
			$WB/WinBar.visible = true
			$WB/WinBar.color = Color(255 if win[0] == 2 else 0, 0, 255 if win[0] == 1 else 0, 255)
			if win[1] in [0, 1, 2]:
				$WB.set_position(Vector2(60, 480 + win[1] * 165 ))
			elif win[1] in [3, 4, 5]:
				$WB.set_position(Vector2(55 + 160 * (win[1] - 3) , 480))
				$WB.pivot_offset = Vector2(60, 10)
				$WB.rotation_degrees = 90
			elif (win[1] == 6):
				$WB.pivot_offset = Vector2(25, 75)
				$WB.rotation_degrees = 45
			elif win[1] == 7:
				$WB.pivot_offset = Vector2(425, 75)
				$WB.rotation_degrees = 315
		if Input.get_action_strength("1") > 0 and cells[0] == 0:
			cells[0] = playerTurn
			if playerTurn == 1:
				$Board/Square/Naught.visible = true
				playerTurn = 2
			else:
				$Board/Square/Cross.visible = true
				playerTurn = 1
			print("0, 0 Pressed by Player ", playerTurn)
		if Input.get_action_strength("2") > 0 and cells[1] == 0:
			cells[1] = playerTurn
			if playerTurn == 1:
				$Board/Square2/Naught.visible = true
				playerTurn = 2
			else:
				$Board/Square2/Cross.visible = true
				playerTurn = 1
			print("0, 1 Pressed")
		if Input.get_action_strength("3") > 0 and cells[2] == 0:
			cells[2] = playerTurn
			if playerTurn == 1:
				$Board/Square3/Naught.visible = true
				playerTurn = 2
			else:
				$Board/Square3/Cross.visible = true
				playerTurn = 1
			print("0, 2 Pressed")
		if Input.get_action_strength("4") > 0 and cells[3] == 0:
			cells[3] = playerTurn
			if playerTurn == 1:
				$Board/Square4/Naught.visible = true
				playerTurn = 2
			else:
				$Board/Square4/Cross.visible = true
				playerTurn = 1
			print("1, 0 Pressed")
		if Input.get_action_strength("5") > 0 and cells[4] == 0:
			cells[4] = playerTurn
			if playerTurn == 1:
				$Board/Square5/Naught.visible = true
				playerTurn = 2
			else:
				$Board/Square5/Cross.visible = true
				playerTurn = 1
			print("1, 1 Pressed")
		if Input.get_action_strength("6") > 0 and cells[5] == 0:
			cells[5] = playerTurn
			if playerTurn == 1:
				$Board/Square6/Naught.visible = true
				playerTurn = 2
			else:
				$Board/Square6/Cross.visible = true
				playerTurn = 1
			print("1, 2 Pressed")
		if Input.get_action_strength("7") > 0 and cells[6] == 0:
			cells[6] = playerTurn
			if playerTurn == 1:
				$Board/Square7/Naught.visible = true
				playerTurn = 2
			else:
				$Board/Square7/Cross.visible = true
				playerTurn = 1
			print("2, 0 Pressed")
		if Input.get_action_strength("8") > 0 and cells[7] == 0:
			cells[7] = playerTurn
			if playerTurn == 1:
				$Board/Square8/Naught.visible = true
				playerTurn = 2
			else:
				$Board/Square8/Cross.visible = true
				playerTurn = 1
			print("2, 1 Pressed")
		if Input.get_action_strength("9") > 0 and cells[8] == 0:
			cells[8] = playerTurn
			if playerTurn == 1:
				$Board/Square9/Naught.visible = true
				playerTurn = 2
			else:
				$Board/Square9/Cross.visible = true
				playerTurn = 1
			print("2, 0 Pressed")
	
