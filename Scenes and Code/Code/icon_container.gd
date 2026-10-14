extends VBoxContainer

var icon_node = preload("res://Scenes and Code/Scenes/Character Icons.tscn")
@onready var stats_screen_button: Button = $"Stats Screen Button"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_icons()
	move_button()
	
#	for child in get_children():
#		child.update_stats()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_icons():
	for character in Global.char_dict: #For each character in the Global character dictionary
		#print("Icon for character " + character + " is being added.")
		var icon = icon_node.instantiate() #instantiate a new icon_node
		icon.character = character #Set it's character to the current character
		add_child(icon) #add the icon to the tree

func move_button():
	move_child(stats_screen_button, -1) #move child to right above the stat screen button

func update_stats():
	for child in get_children(): #for each child in the container
		if not child is Button: #if the child isn't the button
			child.update_stats() #call the update stats function on the child

func song_sorter(character, song_name, misc = false, char_rep = []):
	#if the song passed in is a song with a character not listed in the character dictionary, we add their name to the song
	if misc and not char_rep == []: 
		song_name += " Character(s): " #append the character tag to the song_name
		if char_rep.size() <= 1: #if the character repped is only one
			print(song_name + " has one or no reps listed")
			song_name += char_rep[0] #add the characters name to the end
		else: #if the character is actually multiple
			for char in char_rep: #for each character in the character rep array passed in
				print(song_name + " has " + char + " as a rep.")
				song_name += (char + ", ") #Add the character, with a comma for the seperation
			song_name.rstrip(",") #and strip the final comma
	for child in get_children(): #for the child in the container
		if not child is Button: #if the child isn't a button
			if child.character == character: #and the child's character matches the character assigned to the song
				child.songs_included.append(song_name) #append the song to that icons song list

#Reset's the songs for new lists
func song_reset():
	for child in get_children(): #For each child in the container
		if not child is Button: #not including the buttons
			child.item_list.clear() #clear their item_list
			child.songs_included.clear() #and songs_included
