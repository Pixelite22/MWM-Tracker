extends Control

@export var character : String

var char_img_dict : Dictionary = {
	"Neil Cipher" : [preload("res://Assets/Arts/Megamix Stock Icons/Neil Cipher Stock Icon (Rose Shrimp).png"), load("res://Assets/Arts/Name Plates/Neil Cipher Name Plate.png")],
	"Tyler & The Grinch": [preload("res://Assets/Arts/Megamix Stock Icons/Tyler _ The Grinch Stock Icon (FenzoFRFR, TVGhost, Coach).png"), load("res://Assets/Arts/Name Plates/Tyler _ The Grinch Name Plate.png")],
	"Kid Cobra" : [preload("res://Assets/Arts/Megamix Stock Icons/Kid Cobra Stock Icon (FenzoFRFR).png"), load("res://Assets/Arts/Name Plates/Kid Cobra Name Plate.png")],
	"Detective Hat Kid" : [preload("res://Assets/Arts/Megamix Stock Icons/Detective Hat Kid Stock Icon (Anonymous).png"), load("res://Assets/Arts/Name Plates/Detective Hat Kid Name Plate.png")],
	"Lil Darkie" : [preload("res://Assets/Arts/Megamix Stock Icons/Lil Darkie Stock Icon (Pokopakku).png"), load("res://Assets/Arts/Name Plates/Lil Darkie Name Plate.png")],
	"PLAYING WITH POWER!" : [preload("res://Assets/Arts/Megamix Stock Icons/Playing with Power Stock Icon (FenzoFRFR).png"), load("res://Assets/Arts/Name Plates/Playing With Power Name Plate.png")],
	"Head Chef Heavy" : [preload("res://Assets/Arts/Megamix Stock Icons/Head Chef Heavy Stock Icon (5Kids).png"), load("res://Assets/Arts/Name Plates/Head Chef Heavy Name Plate.png")],
	"Guzma" : [preload("res://Assets/Arts/Megamix Stock Icons/Guzma Stock Icon (FenzoFRFR).png"), load("res://Assets/Arts/Name Plates/Guzma Name Plate.png")],
	"Heaven Ascension DIO" : [preload("res://Assets/Arts/Megamix Stock Icons/Heaven Ascension Dio Stock Icon (sunhatgirl).png"), load("res://Assets/Arts/Name Plates/Heaven Ascension DIO Name Plate v2.0.png")],
	"Ruler of Everything" : [preload("res://Assets/Arts/Megamix Stock Icons/Ruler of Everything Stock Icon (Pokopakku).png"), load("res://Assets/Arts/Name Plates/Ruler of Everything Name Plate.png")],
	"Snailiens" : [preload("res://Assets/Arts/Megamix Stock Icons/Snailiens Stock Icon (sunhatgirl).png"), load("res://Assets/Arts/Name Plates/Snailiens Name Plate.png")],
	"MONSTERMAU5" : [preload("res://Assets/Arts/Megamix Stock Icons/MONSTERMAU5 Stock Icon (FenzoFRFR, Anonymous).png"), load("res://Assets/Arts/Name Plates/MONSTERMAU5 Name Plate.png")],
	"All-Star Barkley" : [preload("res://Assets/Arts/Megamix Stock Icons/All-Star Barkley Stock Icon (FenzoFRFR).png"), load("res://Assets/Arts/Name Plates/All-Star Barkley Name Plate.png")],
	"Ace D. Copular" : [preload("res://Assets/Arts/Megamix Stock Icons/Ace Stock Icon (FenzoFRFR).png"), load("res://Assets/Arts/Name Plates/Ace D Copular Name Plate.png")],
	"gSports" : [preload("res://Assets/Arts/Megamix Stock Icons/gSports Stock Icon (FenzoFRFR).png"), load("res://Assets/Arts/Name Plates/gSports Name Plate.png")],
	"MTT! Tour" : [preload("res://Assets/Arts/Megamix Stock Icons/MTT Tour Stock Icon (MS360).png"), load("res://Assets/Arts/Name Plates/MTT! Tour Name Plate.png")],
	"Scatman & Hatman" : [preload("res://Assets/Arts/Megamix Stock Icons/Scatman & Hatman Stock Icon (5Kids, TVGhost).png"), load("res://Assets/Arts/Name Plates/Scatman _ Hatman Name Plate.png")],
	"Bad Girlz" : [preload("res://Assets/Arts/Megamix Stock Icons/Bad Girlz Stock Icon (sunhatgirl).png"), load("res://Assets/Arts/Name Plates/Bad_Girlz_Name_Plate v2.0.png")],
	"Rick Hentai" : [preload("res://Assets/Arts/Megamix Stock Icons/Rick Hentai Stock Icon (sunhatgirl).png"), load("res://Assets/Arts/Name Plates/Rick Hentai Name Plate.png")],
	"Cadence" : [preload("res://Assets/Arts/Megamix Stock Icons/Cadence Stock Icon (Speed_Wielder).png"), load("res://Assets/Arts/Name Plates/Cadence Name Plate.png")],
	"River City Girls" : [preload("res://Assets/Arts/Megamix Stock Icons/River City Girls Stock Icon (Speed_Wielder).png"), load("res://Assets/Arts/Name Plates/River City Girls Name Plate.png")],
	"Reanimatedd" : [preload("res://Assets/Arts/Megamix Stock Icons/Reanimatedd Stock Icon (MS360).png"), load("res://Assets/Arts/Name Plates/Reanimatedd Name Plate.png")],
	"Forum Freakshow" : [preload("res://Assets/Arts/Megamix Stock Icons/Forum Freakshow Stock Icon (TVGhost).png"), load("res://Assets/Arts/Name Plates/Forum Freak Show Name Plate.png")],
	"Black Mamba Farquaad" : [preload("res://Assets/Arts/Megamix Stock Icons/Black Mamba Farquaad Stock (TVGhost).png"), load("res://Assets/Arts/Name Plates/Black Mamba Farquaad Name Plate.png")],
	"Hot Ones" : [preload("res://Assets/Arts/Megamix Stock Icons/Hot Ones Stock Icon (sunhatgirl).png"), load("res://Assets/Arts/Name Plates/Hot Ones Name Plate.png")],
	"Painful Dreamers" : [preload("res://Assets/Arts/Megamix Stock Icons/Painful Dreamers Stock Icon (TVGhost, sunhatgirl).png"), load("res://Assets/Arts/Name Plates/Painful Dreamers Name Plate.png")],
	"Netherrack Nightmares" : [preload("res://Assets/Arts/Megamix Stock Icons/Netherrack Nightmares Stock Icon (FenzoFRFR, Coach).png"), load("res://Assets/Arts/Name Plates/Netherrack Nightmares Name Plate.png")],
	"Elliana" : [preload("res://Assets/Arts/Megamix Stock Icons/Elliana Stock Icon (5Kids).png"), load("res://Assets/Arts/Name Plates/Elliana Name Plate.png")],
	"MAD/EON" : [preload("res://Assets/Arts/Megamix Stock Icons/MAD_EON Stock Icon.png"), load("res://Assets/Arts/Name Plates/MAD EON Name Plate.png")],
	"lofi girl" : [preload("res://Assets/Arts/Megamix Stock Icons/Lofi Girl Stock Icon (Speed_Wielder, cinnamonspiders).png"), load("res://Assets/Arts/Name Plates/Lofi Girl Nameplate v2.0.png")],
	"Gustavo Rocque" : [preload("res://Assets/Arts/Megamix Stock Icons/Gustavo Stock Icon (FenzoFRFR).png"), load("res://Assets/Arts/Name Plates/Gustavo_Name_Plate_ v2.0.png")],
	"Club Bangers" : [preload("res://Assets/Arts/Megamix Stock Icons/Club Bangers Stock Icon (MS360).png"), load("res://Assets/Arts/Name Plates/Club Bangers Name Plate.png")],
	"Scott the Woz" : [preload("res://Assets/Arts/Megamix Stock Icons/Scott the Woz Stock Icon (Rose Shrimp).png"), load("res://Assets/Arts/Name Plates/Scott The Woz Name Plate.png")],
	"Susie Haltmann" : [preload("res://Assets/Arts/Megamix Stock Icons/Susie Haltmann Stock Icon (FenzoFRFR).png"), load("res://Assets/Arts/Name Plates/Susie Haltmann Name Plate.png")],
	"Dexter's Dad" : [preload("res://Assets/Arts/Megamix Stock Icons/Dexter_s Dad Stock Icon (MS360).png"), null],
	"Discoholic" : [preload("res://Assets/Arts/Megamix Stock Icons/disco.png"), null],
	"Cici" : [preload("res://Assets/Arts/Megamix Stock Icons/cici.png"), null],
	"Misc." : [preload("res://Assets/Arts/Megamix Stock Icons/Megamix Discord Icon No BG.png"), null]
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
	icon.texture = char_img_dict[character][0] #load the image associated with the character into the icon node
	if char_img_dict[character][1] != null: #If there is a name plate
		nameplate.texture = char_img_dict[character][1] #load the nameplate as well
	
	Global.scan_done.connect(song_list)

#This is called every time the song total is updated
func update_stats():
	songs.text = "Songs:\n" + str(Global.char_dict[character][0]) 
	solos.text = "Solos:\n" + str(Global.char_dict[character][1])
	collabs.text = "Collabs:\n" + str(Global.char_dict[character][2])

func song_list():
	for song in songs_included:
		if song.contains(" - Mashup Week: Megamix"):
			var song_end = song.find(" - Mashup Week: Megamix")
			item_list.add_item(song.substr(0, song_end))
		else:
			item_list.add_item(song)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	item_list.position = get_local_mouse_position()
	item_list.show()

func _on_item_list_mouse_exited() -> void:
	item_list.hide()
