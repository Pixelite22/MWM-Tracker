extends Control

@onready var stats_screen_proper: ScrollContainer = $"Stats Screen Proper"
@onready var fav_composers_screen: ScrollContainer = $"Fav Composers Screen"
@onready var favorite_character: Control = $"Stats Screen Proper/VBoxContainer/Favorite Character"
@onready var runner_up_character: Control = $"Stats Screen Proper/VBoxContainer/Runner Up Character"
@onready var solo_character: Control = $"Stats Screen Proper/VBoxContainer/Solo Character"
@onready var colab_character: Control = $"Stats Screen Proper/VBoxContainer/Colab Character"
@onready var v_box_container_stats: VBoxContainer = $"Stats Screen Proper/VBoxContainer"
@onready var least_favorite_character: Control = $"Stats Screen Proper/VBoxContainer/Least Favorite Character"
@onready var favorite_composers: Label = $"Stats Screen Proper/VBoxContainer/Favorite Composers"
@onready var og_song_count: Label = $"Stats Screen Proper/VBoxContainer/OG Song Count"
@onready var remix_count_header: Label = $"Stats Screen Proper/VBoxContainer/Remix Count Header"
@onready var song_count: Label = $"Stats Screen Proper/VBoxContainer/Song Count"
@onready var favorite_composer_full_info: Button = $"Stats Screen Proper/VBoxContainer/Favorite Composer Full Info"
@onready var v_box_container_comps: VBoxContainer = $"Fav Composers Screen/VBoxContainer"
#@onready var remix_or_og: Label = $"ScrollContainer/VBoxContainer/Remix or OG"

var least_excludes = ["Scott the Woz", "Susie Haltmann", "Discoholic", "Cici", "Dexter's Dad", "Tony Stark", "Garfield", "Misc."]
##Explainers for the Exclusions:
##The app is meant to be for active participants, meaning the characters that aren't in the tourney shouldnt be included
##These characters also have the least songs available, meaning if you favorite somehow IS one of them, they still could theoretically read as least due to their low songs making them outliers
##Scott and Susie have been in a while and might be worth readding for some though
##Discoholic and Cici have only just joined so they don't have enough time... though a Cici joke winning screen could be funny
##Dexter's Dad is a joke character with one real song and one advertisment that is treated as a song.
##Tony Stark and Garfield each have a single song in the entire tourny, both in remix week.  They aren't really characters but just needed to be credited properly
##Misc is the catch all for the songs that have characters we haven't heard of


#Declare some needed nested arrays
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

func setup():
	char_finder()
	fav_comp()
	misc_value_handling()

func char_finder():
	for char in Global.char_dict:
		if Global.char_dict[char][0] >= favs[0][1]: #Makes sure the current fav is less
			fav_edits(char, Global.char_dict[char][0]) #Then mark the new fav
		if Global.char_dict[char][0] <= womp_womps[0][1]: #Make sure the least fav character is chosen of the two
			least_edits(char, Global.char_dict[char][0]) #Mark them as new least fav
		if Global.char_dict[char][1] >= solos[0][1]: #If observed char has more or the same solos then the current highest
			soloist(char, Global.char_dict[char][1]) #set them as new solo
		if Global.char_dict[char][2] >= colabs[0][1]: #If observed char has more or the same colabs then current highest
			colaber(char, Global.char_dict[char][2]) #Set them as new colaber

	for char in Global.char_dict: #loop again for runner up
		if Global.char_dict[char][0] >= runner_ups[0][1]: #If observed character is bigger or equal to  current runner up
			runner_up_edits(char, Global.char_dict[char][0]) #Push through to runner up edits
	
	set_the_stage() #Display results

func runner_up_edits(char, value):
	#if the passed in character is in the favorites array, end the function early as they are a favorite
	for fav in favs: 
		if char in fav:
			return
	
	if runner_ups[0][1] < value: #If the value is greater then current runner up
		runner_ups.clear() #Clear the array
	runner_ups.append([char, value]) #append the runner up

#Most of the following follow the same pattern of, check if bigger, if they are, clear the array, and no matter what, append the new char
func fav_edits(char, value):
	if favs[0][1] < value:
		favs.clear()
	favs.append([char, value])

func least_edits(char, value):
	if not char in least_excludes: #This makes sure chars I have listed but shouldn't be considered a least favorite due to not being in the tourney proper aren't counted as a least favorite
		if womp_womps[0][1] > value:
			womp_womps.clear()
		womp_womps.append([char, value])
		#print("Least favorites: " + str(womp_womps))

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
	#print("Entered Char_Setup for " + base_node.name)
	#print(type)
	var new_char #initialize for the character being handled
	if type.size() > 1: #if the array passed in has more then one element
		for char in type: #For each character in that array
			#print(char)
			new_char = base_node.duplicate() #Duplicate the placeholder base_node
			v_box_container_stats.add_child(new_char) #add it to the v_box
			v_box_container_stats.move_child(new_char, base_node.get_index()) #and move it to the proper position
			#print(new_char)
			new_char.set_script(load("res://Scenes and Code/Code/character_icons.gd")) #then ensure it has the necissary script on it
			#await new_char.ready
			new_char.character = char[0] #Set the character by targeting it in the array
			new_char.icon_setup(true) #Call the icon setup on the character
			new_char.update_stats() #Update the stats so they show proper
			new_char.item_list.queue_free()
			#new_char.song_list() #update the song list ##NOT WORKING AS OF RIGHT NOW
			#print(new_char.name + " is " + new_char.character)
		base_node.hide() #Hide the base node 
	else: #If the array only has one character
		base_node.show() #Ensure the base node is visible
		#and set it up like how the duplicates were set up in the if section
		base_node.character = type[0][0] 
		base_node.icon_setup(true)
		base_node.update_stats()
		base_node.item_list.queue_free()
		#base_node.song_list()
		#print(base_node.name + " is " + base_node.character)

var top_comps = []
func fav_comp():
	var comp_array = []
	for musician in Global.composer_times: #Loop through the musicians that appear in the composer times dictionary in global
		comp_array.append([musician, Global.composer_times[musician]]) #append that musician to the comp_array
	
	comp_array.sort_custom(comp_sorting) #and sort it from highest to lowest
	
	print(Global.composer_dict)
	
	var i = 1
	for music in comp_array: #for each musician in the comp array
		print("music: " + str(music))
		if music[0] != "Anonymous (Per Request)": #if they are anonymous, remove them as this can be a variety of people
			create_new_credit(music[0])
			if top_comps.size() < 3: #Fill top_comp with only the top 3 composers
				top_comps.append({music[0] : Global.composer_dict[music[0]]})
				
				var composer_load = load("res://Scenes and Code/Scenes/favorite_composers.tscn") #load a new composer scene
				var composer = composer_load.instantiate() #instantiate it
				composer.text = music[0] #Change the text to be that of a composers name
				v_box_container_stats.add_child(composer) #add the child to the vbox
				for song in Global.composer_dict[music[0]]: #not currently working but meant to list their songs
					composer.songs.append(song)
				composer.list_em() #List composer music
				v_box_container_stats.move_child(composer, favorite_composers.get_index() + i) #move composer node to the correct spot
				i += 1 #increment i 
	
	create_new_credit("Anonymous (Per Request)")

func create_new_credit(musician):
	var musician_label = Label.new()
	var song_label = Label.new()
	var songs = ""
	musician_label.autowrap_mode = 2
	musician_label.add_theme_color_override("font_outline_color", Color.BLACK)
	musician_label.add_theme_constant_override("outline_size", 10)
	musician_label.add_theme_font_size_override("font_size", 36)
	musician_label.text = musician + ": "
	if musician in Global.composer_dict.keys():
		for song in Global.composer_dict[musician]:
			song = song.substr(0, song.find(" - Mashup Week: Megamix"))
			song = song.substr(0, song.find(" - Remix Week"))
			songs += " - " + song + "\n"
	songs.rstrip("\n")
	song_label.text = songs
	song_label.autowrap_mode = 2
	song_label.add_theme_color_override("font_outline_color", Color.BLACK)
	song_label.add_theme_constant_override("outline_size", 10)
	song_label.add_theme_font_size_override("font_size", 27)
	
	var button_loc = $"Fav Composers Screen/VBoxContainer/Return to Stats Screen".get_index()
	v_box_container_comps.add_child(song_label)
	v_box_container_comps.move_child(song_label, button_loc)
	v_box_container_comps.add_child(musician_label)
	v_box_container_comps.move_child(musician_label, button_loc)
	

func comp_sorting(a, b):
	#if the value at index 1 of a is greater then that of b, return true, otherwise return false so they can flip
	if a[1] > b[1]:
		return true
	return false

func misc_value_handling():
	#count how many songs are for the megamix proper
	og_song_count.text = "Megamix Songs: "
	og_song_count.text += str(Global.og_songs)
	
	#count how many are from remix week
	remix_count_header.text = "Remix Week Songs: "
	remix_count_header.text += str(Global.remix_songs)
	
	#Let the user know which they like more!
	#if Global.remix_songs > Global.og_songs:
	#	remix_or_og.text = "Remix!"
	#elif Global.remix_songs < Global.og_songs:
	#	remix_or_og.text = "Megamix Master!"
	#else:
	#	remix_or_og.text = "...How did you have an even mix of remixes and originals..."
	
	#List the number of songs in the playlist
	song_count.text = "You have x songs in this playlist!".replace("x", str(Global.remix_songs + Global.og_songs + Global.unknown_songs))


func _on_favorite_composer_full_info_pressed() -> void:
	stats_screen_proper.hide()
	fav_composers_screen.show()
	


func _on_return_to_stats_screen_pressed() -> void:
	fav_composers_screen.hide()
	stats_screen_proper.show()
