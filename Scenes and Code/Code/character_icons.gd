extends Control

@export var character : String


var char_img_dict : Dictionary = {
	#Character : [stock, nameplate, fullart]
	"Neil Cipher" : ["res://Assets/Arts/Megamix Stock Icons/Neil Cipher Stock Icon (Rose Shrimp).png", "res://Assets/Arts/Name Plates/Neil Cipher Name Plate.png", "res://Assets/Arts/Full Art/Neil Cipher (Rose Shrimp).png"],
	"Tyler & The Grinch": ["res://Assets/Arts/Megamix Stock Icons/Tyler _ The Grinch Stock Icon (FenzoFRFR, TVGhost, Coach).png", "res://Assets/Arts/Name Plates/Tyler _ The Grinch Name Plate.png", "res://Assets/Arts/Full Art/Tyler _ The Grinch (Anonymous).png"],
	"Kid Cobra" : ["res://Assets/Arts/Megamix Stock Icons/Kid Cobra Stock Icon (FenzoFRFR).png", "res://Assets/Arts/Name Plates/Kid Cobra Name Plate.png", "res://Assets/Arts/Full Art/Kid Cobra (DiamondBrickZ).png"],
	"Detective Hat Kid" : ["res://Assets/Arts/Megamix Stock Icons/Detective Hat Kid Stock Icon (Anonymous).png", "res://Assets/Arts/Name Plates/Detective Hat Kid Name Plate.png", "res://Assets/Arts/Full Art/Detective Hat Kid (Anonymous).png"],
	"Lil Darkie" : ["res://Assets/Arts/Megamix Stock Icons/Lil Darkie Stock Icon (Pokopakku).png", "res://Assets/Arts/Name Plates/Lil Darkie Name Plate.png", "res://Assets/Arts/Full Art/Lil Darkie (Pokopakku).png"],
	"PLAYING WITH POWER!" : ["res://Assets/Arts/Megamix Stock Icons/Playing with Power Stock Icon (FenzoFRFR).png", "res://Assets/Arts/Name Plates/Playing With Power Name Plate.png", "res://Assets/Arts/Full Art/Playing With Power (FenzoFRFR).png"],
	"Head Chef Heavy" : ["res://Assets/Arts/Megamix Stock Icons/Head Chef Heavy Stock Icon (5Kids).png", "res://Assets/Arts/Name Plates/Head Chef Heavy Name Plate.png", "res://Assets/Arts/Full Art/Head Chef Heavy (TVGhost ft. EvKem).png"],
	"Guzma" : ["res://Assets/Arts/Megamix Stock Icons/Guzma Stock Icon (FenzoFRFR).png", "res://Assets/Arts/Name Plates/Guzma Name Plate.png", "res://Assets/Arts/Full Art/Guzma and Golisopod (Guzma - Lazer Chicken, RedHeartPink, Golisopod - 5Kids).png"],
	"Heaven Ascension DIO" : ["res://Assets/Arts/Megamix Stock Icons/Heaven Ascension Dio Stock Icon (sunhatgirl).png", "res://Assets/Arts/Name Plates/Heaven Ascension DIO Name Plate v2.0.png", "res://Assets/Arts/Full Art/Heaven Ascension DIO (Anonymous).png"],
	"Ruler of Everything" : ["res://Assets/Arts/Megamix Stock Icons/Ruler of Everything Stock Icon (Pokopakku).png", "res://Assets/Arts/Name Plates/Ruler of Everything Name Plate.png", "res://Assets/Arts/Full Art/Ruler of Everything (Rose Shrimp).png"],
	"Snailiens" : ["res://Assets/Arts/Megamix Stock Icons/Snailiens Stock Icon (sunhatgirl).png", "res://Assets/Arts/Name Plates/Snailiens Name Plate.png", "res://Assets/Arts/Full Art/Snailens (cinnamonspiders).png"],
	"MONSTERMAU5" : ["res://Assets/Arts/Megamix Stock Icons/MONSTERMAU5 Stock Icon (FenzoFRFR, Anonymous).png", "res://Assets/Arts/Name Plates/MONSTERMAU5 Name Plate.png", "res://Assets/Arts/Full Art/MONSTERMAU5_Unused_Gradient_Outline (EvKem).png"],
	"All-Star Barkley" : ["res://Assets/Arts/Megamix Stock Icons/All-Star Barkley Stock Icon (FenzoFRFR).png", "res://Assets/Arts/Name Plates/All-Star Barkley Name Plate.png", "res://Assets/Arts/Full Art/All-Star Barkley (TVGhost).png"],
	"Ace D. Copular" : ["res://Assets/Arts/Megamix Stock Icons/Ace Stock Icon (FenzoFRFR).png", "res://Assets/Arts/Name Plates/Ace D Copular Name Plate.png", "res://Assets/Arts/Full Art/Ace D. Copular (TVGhost).png"],
	"gSports" : ["res://Assets/Arts/Megamix Stock Icons/gSports Stock Icon (FenzoFRFR).png", "res://Assets/Arts/Name Plates/gSports Name Plate.png", "res://Assets/Arts/Full Art/gSports (TVGhost ft. Deadhand).png"],
	"MTT! Tour" : ["res://Assets/Arts/Megamix Stock Icons/MTT Tour Stock Icon (MS360).png", "res://Assets/Arts/Name Plates/MTT! Tour Name Plate.png", "res://Assets/Arts/Full Art/MTT! Tour (pokopakku).png"],
	"Scatman & Hatman" : ["res://Assets/Arts/Megamix Stock Icons/Scatman & Hatman Stock Icon (5Kids, TVGhost).png", "res://Assets/Arts/Name Plates/Scatman _ Hatman Name Plate.png", "res://Assets/Arts/Full Art/Scatman _ Hatman (TVGhost).png"],
	"Bad Girlz" : ["res://Assets/Arts/Megamix Stock Icons/Bad Girlz Stock Icon (sunhatgirl).png", "res://Assets/Arts/Name Plates/Bad_Girlz_Name_Plate v2.0.png", "res://Assets/Arts/Full Art/Bad Girls (EvKem).png"],
	"Rick Hentai" : ["res://Assets/Arts/Megamix Stock Icons/Rick Hentai Stock Icon (sunhatgirl).png", "res://Assets/Arts/Name Plates/Rick Hentai Name Plate.png", "res://Assets/Arts/Full Art/Rick Hentai (Anonymous).png"],
	"Cadence" : ["res://Assets/Arts/Megamix Stock Icons/Cadence Stock Icon (Speed_Wielder).png", "res://Assets/Arts/Name Plates/Cadence Name Plate.png", "res://Assets/Arts/Full Art/Cadence (Speed_Wielder ft. EvKem).png"],
	"River City Girls" : ["res://Assets/Arts/Megamix Stock Icons/River City Girls Stock Icon (Speed_Wielder).png", "res://Assets/Arts/Name Plates/River City Girls Name Plate.png", "res://Assets/Arts/Full Art/River City Girls (appo777yon).png"],
	"Reanimatedd" : ["res://Assets/Arts/Megamix Stock Icons/Reanimatedd Stock Icon (MS360).png", "res://Assets/Arts/Name Plates/Reanimatedd Name Plate.png", "res://Assets/Arts/Full Art/Reanimatedd (Teleportato ft. EvKem).png"],
	"Forum Freakshow" : ["res://Assets/Arts/Megamix Stock Icons/Forum Freakshow Stock Icon (TVGhost).png", "res://Assets/Arts/Name Plates/Forum Freak Show Name Plate.png", "res://Assets/Arts/Full Art/Forum Freakshow (TVGhost).png"],
	"Black Mamba Farquaad" : ["res://Assets/Arts/Megamix Stock Icons/Black Mamba Farquaad Stock (TVGhost).png", "res://Assets/Arts/Name Plates/Black Mamba Farquaad Name Plate.png", "res://Assets/Arts/Full Art/Black Mamba Farquaad (TVGhost).png"],
	"Hot Ones" : ["res://Assets/Arts/Megamix Stock Icons/Hot Ones Stock Icon (sunhatgirl).png", "res://Assets/Arts/Name Plates/Hot Ones Name Plate.png", "res://Assets/Arts/Full Art/Hot Ones (appo777yon ft. Deadhand).png"],
	"Painful Dreamers" : ["res://Assets/Arts/Megamix Stock Icons/Painful Dreamers Stock Icon (TVGhost, sunhatgirl).png", "res://Assets/Arts/Name Plates/Painful Dreamers Name Plate.png", "res://Assets/Arts/Full Art/Painful_Dreamers_TVGhost_ft_Deadhand.png"],
	"Netherrack Nightmares" : ["res://Assets/Arts/Megamix Stock Icons/Netherrack Nightmares Stock Icon (FenzoFRFR, Coach).png", "res://Assets/Arts/Name Plates/Netherrack Nightmares Name Plate.png", "res://Assets/Arts/Full Art/Netherrack Nightmares (5Kids, pokopakku).png"],
	"Elliana" : ["res://Assets/Arts/Megamix Stock Icons/Elliana Stock Icon (5Kids).png", "res://Assets/Arts/Name Plates/Elliana Name Plate.png", "res://Assets/Arts/Full Art/Elliana (5Kids).png"],
	"MAD/EON" : ["res://Assets/Arts/Megamix Stock Icons/MAD_EON Stock Icon.png", "res://Assets/Arts/Name Plates/MAD EON Name Plate.png", "res://Assets/Arts/Full Art/MAD_EON (DiamondBrickZ).png"],
	"lofi girl" : ["res://Assets/Arts/Megamix Stock Icons/Lofi Girl Stock Icon (Speed_Wielder, cinnamonspiders).png", "res://Assets/Arts/Name Plates/Lofi Girl Nameplate v2.0.png", "res://Assets/Arts/Full Art/Lofi Girl (cinnamonspiders).png"],
	"Gustavo Rocque" : ["res://Assets/Arts/Megamix Stock Icons/Gustavo Stock Icon (FenzoFRFR).png", "res://Assets/Arts/Name Plates/Gustavo_Name_Plate_ v2.0.png", "res://Assets/Arts/Full Art/Gustavo Rocque (5Kids, EvKem).png"],
	"Club Bangers" : ["res://Assets/Arts/Megamix Stock Icons/Club Bangers Stock Icon (MS360).png", "res://Assets/Arts/Name Plates/Club Bangers Name Plate.png", "res://Assets/Arts/Full Art/Club Bangers (Pokopakku).png"],
	"Scott the Woz" : ["res://Assets/Arts/Megamix Stock Icons/Scott the Woz Stock Icon (Rose Shrimp).png", "res://Assets/Arts/Name Plates/Scott The Woz Name Plate.png", "res://Assets/Arts/Full Art/Scott The Woz (Rose Shrimp).png"],
	"Susie Haltmann" : ["res://Assets/Arts/Megamix Stock Icons/Susie Haltmann Stock Icon (FenzoFRFR).png", "res://Assets/Arts/Name Plates/Susie Haltmann Name Plate.png", "res://Assets/Arts/Full Art/Susie Haltmann (Anonymous, Rose Shrimp).png"],
	"Discoholic" : ["res://Assets/Arts/Megamix Stock Icons/disco.png", "res://Assets/Arts/Name Plates/discoholic_plate.png", "res://Assets/Arts/Full Art/Discoholic_Portrait (Crack Frost).png"],
	"Cici" : ["res://Assets/Arts/Megamix Stock Icons/cici.png", "res://Assets/Arts/Name Plates/cici_nameplate.png", "res://Assets/Arts/Full Art/mwm_cici_render_f (EvKem).png"],
	"Dexter's Dad" : ["res://Assets/Arts/Megamix Stock Icons/Dexter_s Dad Stock Icon (MS360).png", "res://Assets/Arts/Name Plates/dexters_dad_plate_1.png", "res://Assets/Arts/Full Art/Dexter_s Dad (TVGhost).png"],
	"Misc." : ["res://Assets/Arts/Megamix Stock Icons/Megamix Discord Icon No BG.png", "res://Assets/Arts/Name Plates/Mashup_Week_Megamix_nameplate.png", "res://Assets/Arts/Megamix Stock Icons/Megamix Discord Icon No BG.png"]
}

@onready var icon: TextureRect = $Icon
@onready var nameplate: TextureRect = $Nameplate
@onready var songs: RichTextLabel = $"Text Boxes/Songs"
@onready var solos: RichTextLabel = $"Text Boxes/Solos"
@onready var collabs: RichTextLabel = $"Text Boxes/Collabs"

var songs_included = []
@onready var item_list: ItemList = $ItemList

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if icon != null:
		icon_setup()
	Global.scan_done.connect(song_list)

func icon_setup(full_art := false):
	if full_art:
		icon.texture = load(char_img_dict[character][2])
	else:
		icon.texture = load(char_img_dict[character][0]) #load the image associated with the character into the icon node
	if char_img_dict[character][1] != null: #If there is a name plate
		nameplate.texture = load(char_img_dict[character][1]) #load the nameplate as well

#This is called every time the song total is updated
func update_stats():
	songs.text = "Songs:\n" + str(Global.char_dict[character][0]) 
	solos.text = "Solos:\n" + str(Global.char_dict[character][1])
	collabs.text = "Collabs:\n" + str(Global.char_dict[character][2])

func song_list():
	for song in songs_included: #For all the songs
		if song.contains(" - Mashup Week: Megamix"): #If the title includes the normal mashup week tag
			var song_end = song.find(" - Mashup Week: Megamix") #find the index it is on
			item_list.add_item(song.substr(0, song_end)) #and add the song to the list after cutting off the tag
		elif song.contains(" - Remix Week"): #Repeat above but for remix tag
			var song_end = song.find(" - Remix Week")
			item_list.add_item(song.substr(0, song_end))
		else: #and if none of the tags are there
			item_list.add_item(song) #Just add the song 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	item_list.position = get_local_mouse_position()
	item_list.show()

func _on_item_list_mouse_exited() -> void:
	item_list.hide()
