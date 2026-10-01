extends Control

@onready var playlist_post_screen: Control = $"Playlist post screen"
@onready var display_screen: Control = $"Display Screen"
@onready var saved_playlist_screen: Control = $"Saved Playlist Screen"
@onready var loading_screen: Control = $"Loading Screen"
@onready var stats_screen: Control = $"Stats Screen"


@onready var http_request: HTTPRequest = $HTTPRequest
@onready var icon_container: VBoxContainer = $"Display Screen/ScrollContainer/Icon Container"

var page

var screen_tracking = [] #current, prev

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	playlist_post_screen.playlist_button_pressed.connect(start_the_show)
	saved_playlist_screen.kick_it.connect(start_the_show)
	
	playlist_post_screen.saved_playlist_show.connect(load_em_and_show_em)
	Global.scan_done.connect(shows_over)

func start_the_show():
	for child in get_children(): #for child nodes
		if child is not TextureRect and child is not HTTPRequest: #if the node isn't the background or the internet grabber
			child.hide() #hide the child
	loading_screen.show() #show the display screen
	loading_screen.curr_state = loading_screen.load_states.values().pick_random()
	loading_screen.load_screen()
	screen_tracking = [display_screen, playlist_post_screen]
	icon_container.song_reset()
	print("Link for debug: " + Global.link) #print the link for debug
	Global.set_playlist() #builds the starting link to the webpage we need to pull the info from
	
	request_page() #Call the request page func

func load_em_and_show_em():
	for child in get_children(): #for all child nodes
		if child is not TextureRect and child is not HTTPRequest: #if node isnt background or internet grabber
			child.hide() #hide it
	saved_playlist_screen.show() #show the saved playlist
	screen_tracking = [saved_playlist_screen, playlist_post_screen]
	saved_playlist_screen.sort_em_out(Global.load_playlists()) #start the sorting function on the loaded playlist 

var last_link
func request_page():
	if not http_request.request_completed.is_connected(page_read): #if the webpage hasn't already been connected
		http_request.request_completed.connect(page_read) #set the signal to this function to activate when the request is complete
	if Global.link != last_link:
		http_request.request(Global.link) #Get the request moving
	else:
		print("ERROR:  Link is unchanged")
	last_link = Global.link

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func page_read(result, response_code, headers, body):
	page = JSON.parse_string(body.get_string_from_utf8()) #Set the page to a JSON made of all text on the page
	
	song_catcher() #Call this to catch and record song info
	print(str(Global.composer_dict))
	icon_container.update_stats() #Have the stats actually update on screnn
	next_page() #move to the next webpage

func song_catcher():
	#The way tthe api page is structured, you need to narrow down where the description is stroed for each video
	for descrips in page["items"]: #This loop runs over every song on the api page (about 5)
		var description = descrips["snippet"]["description"] #This variable targets the description text only
		var str_start #this is used for the string slicing later
		var str_end #As is this
		var song_found = false #this keeps track if a song places correctly
		print("Song Found is: " + descrips["snippet"]["title"])
		if description.contains("Character Represented: "): #If the description contains the string listed
			str_start = description.find("Character Represented: ")  #Set the start of the string we want to that phrase
			str_end = description.find("\n", str_start) #Then the end to the newline
			song_found = character_increment(description.substr(str_start + 23, str_end - (str_start + 23)), descrips["snippet"]["title"]) #And pull out just the characters, passing them to the character increment function
			misc_catcher(song_found, str_start, str_end, description, descrips["snippet"]["title"])
		elif description.contains("Characters Represented: "): #This is a repeat of above but on colab tracks
			str_start = description.find("Characters Represented: ")
			str_end = description.find("\n", str_start)
			song_found = character_increment(description.substr(str_start + 24, str_end - (str_start + 24)), descrips["snippet"]["title"])
			misc_catcher(song_found, str_start, str_end, description, descrips["snippet"]["title"])
		elif description.contains("Character: "):
			str_start = description.find("Character: ")
			str_end = description.find("\n", str_start)
			song_found = character_increment(description.substr(str_start + 11, str_end - (str_start + 11)), descrips["snippet"]["title"])
			misc_catcher(song_found, str_start, str_end, description, descrips["snippet"]["title"])
		elif description.contains("Characters: "):
			str_start = description.find("Characters: ")
			str_end = description.find("\n", str_start)
			song_found = character_increment(description.substr(str_start + 12, str_end - (str_start + 12)), descrips["snippet"]["title"])
			misc_catcher(song_found, str_start, str_end, description, descrips["snippet"]["title"])
		
		var musician_found
		if description.contains("Musician: "):
			str_start = description.find("Musician: ")
			str_end = description.find("\n", str_start)
			musician_credit(description.substr(str_start + 10, str_end - (str_start + 10)), descrips["snippet"]["title"])

func musician_credit(musician_name, song_name):
	if musician_name in Global.composer_dict.keys():
		Global.composer_dict[musician_name].append(song_name)
		Global.composer_times[musician_name] += 1
	else:
		Global.composer_dict.get_or_add(musician_name, [song_name])
		Global.composer_times[musician_name] = 1


func misc_catcher(song_found, str_start, str_end, description, song_name):
	if not song_found:
		Global.char_dict["Misc."][0] += 1
		if description.substr(str_start, str_end - str_start).contains(",") or description.substr(str_start, str_end - str_start).contains("All"):
			Global.char_dict["Misc."][2] += 1
		else:
			Global.char_dict["Misc."][1] += 1
		icon_container.song_sorter("Misc.", song_name)

func character_increment(chars_repped, song_name):
	print("Characters repped are: " + chars_repped)
	var song_placed = false
	var i = 0
	for character in Global.char_dict: #This searches the character dictionary
		if chars_repped.to_lower().contains(character.to_lower()): #and if a character passed in the string matches one of the characters in the dictionary
			print(character + " found!")
			song_placed = true
			Global.char_dict[character][0] += 1 #increment that characters total songs
			if not chars_repped.contains(",") and not chars_repped.contains(" - "): #and if this string doesn't contain the , character, signalling there is no other rep
				Global.char_dict[character][1] += 1 #increment the solo songs
			else: #otherwise
				Global.char_dict[character][2] += 1 #increment the collabs
			icon_container.song_sorter(character, song_name)
	
	song_placed = found_misspellings_and_special_cases(chars_repped, song_placed)
	
	return song_placed

func found_misspellings_and_special_cases(chars_repped, song_placed):
	#Heaven ascenscion dio instead of heaven ascension dio
	if chars_repped.to_lower().contains("heaven ascenscion dio"):
		print("Heaven Ascension DIO found, even with a mispelling")
		song_placed = true
		Global.char_dict["Heaven Ascension DIO"][0] += 1
		if not chars_repped.contains(","): #and if this string doesn't contain the , character, signalling there is no other rep
			Global.char_dict["Heaven Ascension DIO"][1] += 1 #increment the solo songs
		else: #otherwise
			Global.char_dict["Heaven Ascension DIO"][2] += 1 #increment the collabs
	
	#This is specifically for Charles Barkley which changed to "All-Star Barkley" post his first song
	if chars_repped.to_lower().contains("charles \"all-star\" barkley"):
		song_placed = true
		Global.char_dict["All-Star Barkley"][0] += 1
		if not chars_repped.contains(","): #and if this string doesn't contain the , character, signalling there is no other rep
			Global.char_dict["All-Star Barkley"][1] += 1 #increment the solo songs
		else: #otherwise
			Global.char_dict["All-Star Barkley"][2] += 1 #increment the collabs
	
	return song_placed

var i = 0
func next_page():
	if not page.has("nextPageToken") : #If there is a nextPageToken on the page
		print("Final page reached!  Final page is page " + str(i))
		Global.scan_done.emit()
		#if Global.next_page_key != page["nextPageToken"] && i != 0:
		#	print("ERROR: PAGE NOT CORRECTLY INCREMENTED ON " + str(i) + " TRY")
		#	print("NEXT KEY SHOULD BE " + page["nextPageToken"] + " BUT IS " + Global.next_page_key)
		#	print("fixing now...")
		#	print("Link was: " + Global.link)
		#	Global.link.replace(Global.curr_page_key, Global.next_page_key)
		#	print("Link is now: " + Global.link)
		#	#request_page()
	else:
		i += 1
		Global.next_page_key = page["nextPageToken"] #Set the next_page_key to it
	#	Global.prev_page_key = Global.curr_page_key #Then set the 
	#	Global.curr_page_key = Global.next_page_key
		await Global.next_page() #and call the global version of this function
		request_page() #then loop back into request page

func shows_over():
	#$"Display Screen/End Message".show()
	#await get_tree().create_timer(1.0).timeout
	#$"Display Screen/End Message".hide()
	loading_screen.hide()
	display_screen.show()
	stats_screen.char_finder()
	stats_screen.fav_comp()

func backstage_pass():
	display_screen.hide()
	stats_screen.show()
	screen_tracking = [stats_screen, display_screen]
	

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		if screen_tracking[0] == display_screen:
			for char in Global.char_dict:
				Global.char_dict[char] = [0, 0, 0]
		screen_tracking[1].show()
		screen_tracking[0].hide()
		var temp = screen_tracking[1]
		screen_tracking[1] = screen_tracking[0]
		screen_tracking[0] = screen_tracking[1]
