extends Node


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
	"Heaven Ascension Dio" : [0, 0, 0],
	"The Ruler of Everything" : [0, 0, 0],
	"Snailiens" : [0, 0, 0],
	"MONSTERMAU5" : [0, 0, 0],
	"Charles \"All-Star\" Barkley" : [0, 0, 0],
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
	"Lofi Girl" : [0, 0, 0],
	"Gustavo Rocque" : [0, 0, 0],
	"Club Bangers" : [0, 0, 0],
	"Scott the Woz" : [0, 0, 0],
	"Susie Haltmann" : [0, 0, 0],
	"Dexter's Dad" : [0, 0, 0],
	"Discoholic" : [0, 0, 0],
	"Cici" : [0, 0, 0],
	"Misc." : [0, 0, 0]
}

var link : String = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=INSERTPLAYLISTID&key=INSERTAPIKEY"
@export var playlist_id : String = "PLTQBco8DHO4Q"
@export var api_key : String = "AIzaSyAbcDzameSFIC5-HGKg_1HXoM4RaJZ90mA"
var next_page_key : String
var curr_page_key : String
var prev_page_key : String
var page_token_ext : String = "&pageToken="

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func roll_call():
	var i = 1
	for character in char_dict:
		#print(character + " is Counted!  They are #" + str(i))
		i += 1

func set_playlist():
	link = link.replace("INSERTPLAYLISTID", playlist_id)
	link = link.replace("INSERTAPIKEY", api_key)
	#print("Link to the first page of the api website is: " + link)
	

func next_page():
	#Come back here when we have code to narrow down certain parts of the page... and also after we have actually accessed the page
	if link.find(page_token_ext) == -1:
		link += page_token_ext + next_page_key
		curr_page_key = next_page_key
	else:
		link.replace(curr_page_key, next_page_key)
		curr_page_key = next_page_key

func prev_page():
	if link.find(page_token_ext) == -1:
		link += page_token_ext # + prev_page_key
	else:
		link.replace(curr_page_key, prev_page_key)
	
	next_page_key = curr_page_key
	curr_page_key = prev_page_key
	#prev_page_key = however we pull that from the site
