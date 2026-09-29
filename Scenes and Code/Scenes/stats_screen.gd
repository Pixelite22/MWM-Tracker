extends Control

@onready var favorite_character_label: Label = $"ScrollContainer/VBoxContainer/Favorite Character Label"
@onready var favorite_character: Control = $"ScrollContainer/VBoxContainer/Favorite Character"
@onready var runner_up_label: Label = $"ScrollContainer/VBoxContainer/Runner Up Label"
@onready var runner_up_character: Control = $"ScrollContainer/VBoxContainer/Runner Up Character"

var favs = [
	["N/A", 0]
]

var runner_ups = [
	["N/A", 0]
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func fav_char_finder():
	for char in Global.char_dict:
		if Global.char_dict[char][0] >= favs[0][1]: #Makes sure the current fav is less
			for item in favs: #then for each array in favs
				runner_up_edits(item[0], item[1]) #pass the former fav to the runner ups
			
			fav_edits(char, Global.char_dict[char][0]) #Then mark the new fav
	
	set_the_stage()

func runner_up_edits(char, value):
	if runner_ups[0][1] < value:
		runner_ups.clear()
	runner_ups.append([char, value])

func fav_edits(char, value):
	if favs[0][1] < value:
		favs.clear()
	favs.append([char, value])

func set_the_stage():
	#fav character handling
	if favs.size() > 1:
		pass
	else:
		favorite_character.character = favs[0][0]
		favorite_character.icon_setup()
		favorite_character.update_stats()
		print("Fav Character is: " + favs[0][0])
	
	#Runner up Handling
	if runner_ups.size() > 1:
		pass
	else:
		runner_up_character.character = runner_ups[0][0]
		runner_up_character.icon_setup()
		runner_up_character.update_stats()
		print("Runner up is: " + runner_ups[0][0])
