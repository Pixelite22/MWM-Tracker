extends Control

@onready var favorite_character: Control = $"ScrollContainer/VBoxContainer/Favorite Character"
@onready var runner_up_character: Control = $"ScrollContainer/VBoxContainer/Runner Up Character"
@onready var solo_character: Control = $"ScrollContainer/VBoxContainer/Solo Character"
@onready var colab_character: Control = $"ScrollContainer/VBoxContainer/Colab Character"
@onready var v_box_container: VBoxContainer = $ScrollContainer/VBoxContainer
@onready var least_favorite_character: Control = $"ScrollContainer/VBoxContainer/Least Favorite Character"

var least_excludes = ["Scott the Woz", "Susie Haltmann", "Discoholic", "Cici", "Dexter's Dad", "Misc."]

var favs = [
	["N/A", 0]
]

var runner_ups = [
	["N/A", 0]
]

var solos = [
	["N/A", 0]
]

var colabs = [
	["N/A", 0]
]

var womp_womps = [
	["N/A", 99999999999]
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func char_finder():
	for char in Global.char_dict:
		if Global.char_dict[char][0] >= favs[0][1]: #Makes sure the current fav is less
#			for item in favs: #then for each array in favs
#				runner_up_edits(item[0], item[1]) #pass the former fav to the runner ups
			
			fav_edits(char, Global.char_dict[char][0]) #Then mark the new fav
		if Global.char_dict[char][0] <= womp_womps[0][1]:
			least_edits(char, Global.char_dict[char][0])
		if Global.char_dict[char][1] >= solos[0][1]:
			soloist(char, Global.char_dict[char][1])
		if Global.char_dict[char][2] >= colabs[0][1]:
			colaber(char, Global.char_dict[char][2])

	for char in Global.char_dict:
		if Global.char_dict[char][0] >= runner_ups[0][1]:
			runner_up_edits(char, Global.char_dict[char][0])
	
	set_the_stage()

func runner_up_edits(char, value):
	for fav in favs:
		if char in fav:
			return
	
	if runner_ups[0][1] < value:
		runner_ups.clear()
	runner_ups.append([char, value])

func fav_edits(char, value):
	if favs[0][1] < value:
		favs.clear()
	favs.append([char, value])

func least_edits(char, value):
	if not char in least_excludes:
		if womp_womps[0][1] > value:
			womp_womps.clear()
		womp_womps.append([char, value])
		print("Least favorites: " + str(womp_womps))

func soloist(char, value):
	if solos[0][1] < value:
		solos.clear()
	solos.append([char, value])

func colaber(char, value):
	if colabs[0][1] < value:
		colabs.clear()
	colabs.append([char, value])

func set_the_stage():
	#fav character handling
	char_setup(favs, favorite_character)
	
	#Runner up Handling
	char_setup(runner_ups, runner_up_character)
	
	#Fav Soloist
	char_setup(solos, solo_character)
	
	#Fav Colab
	char_setup(colabs, colab_character)
	
	#Least Favorite
	char_setup(womp_womps, least_favorite_character)

func char_setup(type : Array, base_node : Control):
	print("Entered Char_Setup for " + base_node.name)
	print(type)
	var new_char
	if type.size() > 1:
		for char in type:
			print(char)
			new_char = base_node.duplicate()
			v_box_container.add_child(new_char)
			v_box_container.move_child(new_char, base_node.get_index())
			print(new_char)
			new_char.set_script(load("res://Scenes and Code/Code/character_icons.gd"))
			#await new_char.ready
			new_char.character = char[0]
			new_char.icon_setup(true)
			new_char.update_stats()
			new_char.song_list()
			print(new_char.name + " is " + new_char.character)
		base_node.hide()
	else:
		base_node.show()
		base_node.character = type[0][0]
		base_node.icon_setup(true)
		base_node.update_stats()
		base_node.song_list()
		print(base_node.name + " is " + base_node.character)

var top_comps = []
@onready var favorite_composers: Label = $"ScrollContainer/VBoxContainer/Favorite Composers"
func fav_comp():
	Global.composer_times.sort()
	var i = 1
	for musician in Global.composer_times:
		if top_comps.size() < 3:
			top_comps.append({musician: Global.composer_dict[musician]})
			var composer = favorite_composers.duplicate()
			composer.text = musician
			v_box_container.add_child(composer)
			var song_list = ItemList.new()
			for song in Global.composer_dict[musician]:
				song_list.add_item(song)
			composer.add_child(song_list)
			v_box_container.move_child(composer, favorite_composers.get_index() + i)
			i += 1
		else:
			break
