extends Node

signal scan_done
signal saved_playlist_show

#37 Characters + 1 Misc catch all for errored songs and songs belonging to no listed character
#Key is character name or misc.  Data is [total, solo, collab]
var char_dict : Dictionary = {
	"Neil Cipher" : [0, 0, 0],
	"Tyler & The Grinch": [0, 0, 0],
	"Kid Cobra" : [0, 0, 0],
	"Detective Hat Kid" : [0, 0, 0],
	"Lil Darkie" : [0, 0, 0],
	"PLAYING WITH POWER!" : [0, 0, 0],
	"Head Chef Heavy" : [0, 0, 0],
	"Guzma" : [0, 0, 0],
	"Heaven Ascension DIO" : [0, 0, 0],
	"Ruler of Everything" : [0, 0, 0],
	"Snailiens" : [0, 0, 0],
	"MONSTERMAU5" : [0, 0, 0],
	"All-Star Barkley" : [0, 0, 0],
	"Ace D. Copular" : [0, 0, 0],
	"gSports" : [0, 0, 0],
	"MTT! Tour" : [0, 0, 0],
	"Scatman & Hatman" : [0, 0, 0],
	"Bad Girlz" : [0, 0, 0],
	"Rick Hentai" : [0, 0, 0],
	"Cadence" : [0, 0, 0],
	"River City Girls" : [0, 0, 0],
	"Reanimatedd" : [0, 0, 0],
	"Forum Freakshow" : [0, 0, 0],
	"Black Mamba Farquaad" : [0, 0, 0],
	"Hot Ones" : [0, 0, 0],
	"Painful Dreamers" : [0, 0, 0],
	"Netherrack Nightmares" : [0, 0, 0],
	"Elliana" : [0, 0, 0],
	"MAD/EON" : [0, 0, 0],
	"lofi girl" : [0, 0, 0],
	"Gustavo Rocque" : [0, 0, 0],
	"Club Bangers" : [0, 0, 0],
	"Scott the Woz" : [0, 0, 0],
	"Susie Haltmann" : [0, 0, 0],
	"Discoholic" : [0, 0, 0],
	"Cici" : [0, 0, 0],
	"Dexter's Dad" : [0, 0, 0],
	#"Tony Stark" : [0, 0, 0],
	"Misc." : [0, 0, 0]
}

var playlist_dict = {
	#Playlist : Desired Name
}

var composer_dict = {
	#Musician : [Songs Worked on]
}

var composer_times = {
	#musician : amount of songs
}

var link : String = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=50&playlistId=INSERTPLAYLISTID&key=INSERTAPIKEY"
var link_default : String = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=50&&playlistId=INSERTPLAYLISTID&key=INSERTAPIKEY"
@export var playlist_id : String = "PLTQBco8DHO4Q"
#my playlist: "PLTQBco8DHO4Q"
#Full Playlist: "PLaUNjVsOkdzfbAZzATdDQjYsVaDnae2bk"
#Neil Cipher: "PLaUNjVsOkdzeT8L9qdmu4Y4r2JpXv8a1G" 
@export var api_key : String = "AIzaSyAbcDzameSFIC5-HGKg_1HXoM4RaJZ90mA"
var next_page_key : String
var curr_page_key : String
var prev_page_key : String
var page_token_ext : String = "&pageToken="

const save_file := "user://playlist... list.json"

var remix_songs = 0
var og_songs = 0
var unknown_songs = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_window().set_size(DisplayServer.screen_get_size())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func roll_call():
	var i = 1
	for character in char_dict:
		#print(character + " is Counted!  They are #" + str(i))
		i += 1

func set_playlist():
	if link != link_default: #If the link isn't the default link
		link = link_default #set the link to the cookiecutter defalt
	link = link.replace("INSERTPLAYLISTID", playlist_id) #Replace the playlist placeholder with the playlist id
	link = link.replace("INSERTAPIKEY", api_key) #Replace the API key placeholder with the API key

func next_page():
	#Come back here when we have code to narrow down certain parts of the page... and also after we have actually accessed the page
	if link.find(page_token_ext) == -1: #if the link doesn't have the text extension needed
		link += page_token_ext + next_page_key #add it and the next page key
		curr_page_key = next_page_key #then set the current page to the next page key, showing we have moved
	else:
		link = link.replace(curr_page_key, next_page_key) #Other wise, replace the curr_page_key with the next_page_key
		curr_page_key = next_page_key #and keep curr_page updated
	
	return "Ready"

func prev_page():
	if link.find(page_token_ext) == -1: #if there is a page token extension
		link += page_token_ext # + prev_page_key #add it to the link
	else: #otherwise
		link.replace(curr_page_key, prev_page_key) #replace the current_page_key with the previous one
	
	#set keys correctly
	next_page_key = curr_page_key
	curr_page_key = prev_page_key
	#prev_page_key = however we pull that from the site


#NEED TO CHANGE THIS TO HANDLE SAVING A DICTIONARY INSTEAD OF TEXT
func save_playlists(playlist, name = ""):
	#load the playlist into the general dict
	load_playlists()
	
	#Determine if it is a new or already saved playlist
	var new_playlist : bool
	if playlist in playlist_dict.keys(): #if it is already in the playlist dictionary keys
		new_playlist = false #Set new playlist to false
		if name != "": #If the name passed in isn't blank
			playlist_dict[playlist] = name #Make the playlist key saved as the nickname 
	else: #otherwise
		new_playlist = true #set it to a new playlist
		playlist_dict.get_or_add(playlist, name) #Add it to the playlist
	
	var file = FileAccess.open(save_file, FileAccess.WRITE) #Open the save files
	for list in playlist_dict: #For each line in the playlist dictionary
		file.store_string(playlist + " Named: " + name + "|") #store the string of the playlist, the name of the playlist, and the | end marker
	
	file.close() #Close the file

#Load file data into playlist Dictionary
func load_playlists():
	var file = FileAccess.open(save_file, FileAccess.READ) #set file to an opened save_file
	var content = file.get_as_text() #Get the file content as text
	var line
	while not file.eof_reached():
		line = file.get_line()
		#print("Line: " + line)
		if not line.begins_with("#"):
			var playlist_link_start = line.find("http") #find the playlist in the file
			var playlist_name_start = line.find(" Named: ") + 8
			var playlist_line_ends = line.find("|") #find the end of the playlist in the file
			#print("Start is at: " + str(playlist_link_start) + 
			#" Name split at: " + str(playlist_name_start) + 
			#" End at: " + str(playlist_line_ends))
			
			playlist_dict.get_or_add(line.strip_edges().substr(playlist_link_start, playlist_name_start - 8), line.strip_edges().substr(playlist_name_start, playlist_line_ends - 1).trim_suffix("|"))
	
	file.close() #close the file to prevent leak
	return content #return the text if the value is needed
