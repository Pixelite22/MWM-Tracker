extends Control

var full_art_cred_dict = {
	#Artist : [Item1, Item2, ...]
	"TV Ghost" : [ #9
		"Ace D. Copular", 
		"All-Star Barkley",
		"Black Mamba Farquaad", 
		"Dexter's Dad",
		"Forum Freakshow",
		"gSports",
		"Head Chef Heavy",
		"Painful Dreamers",
		"Scatman & Hatman",
		],
	"EvKem" : [ #7
		"Bad Girls",
		"Cadence", 
		"Gustavo Rocque",
		"Head Chef Heavy",
		"MONSTERMAU5",
		"Cici",
		"Reanimatedd"
	],
	"5Kids" : [ #5
		"Garfield",
		"Elliana",
		"Gustavo Rocque",
		"Golisopod (Part of Guzma's Art)", 
		"Netherrack Nightmares",
	],
	"Rose Shrimp" : [ #4
		"Neil Cipher",
		"Ruler of Everything",
		"Scott The Woz",
		"Susie Haltmann",
	],
	"Pokopakku" : [ #4
		"Club Bangers",
		"Lil Darkie",
		"MTT! Tour",
		"Netherrack Nightmares"
	],
	"Deadhand" : [ #3
		"gSports",
		"Hot Ones",
		"Painful Dreamers",
	],
	"DiamondBrickZ" : [ #2
		"Kid Cobra",
		"MAD/EON",
	],
	"appo777yon" : [ #2
		"Hot Ones",
		"River City Girls",
	],
	"cinnamonspiders" : [ #2
		"Lofi Girl",
		"Snailiens",
	],
	"Crack Frost" : [ #1
		"Discoholic"
	],
	"FenzoFRFR" : [ #1
		"Playing With Power"
	],
	"Speed_Wielder" : [ #1
		"Cadence",
	],
	"Teleportato" : [ #1
		"Reanimatedd",
	],
	"Lazer Chicken" : [ #1
		"Guzma",
	],
	"RedHeartPink" : [ #1
		"Guzma",
	],
	"Anonymous" : [ #5, ignoring sort as it is possibly other people
		"Detective Hat Kid",
		"Heaven Ascension DIO",
		"Rick Hentai",
		"Susie Haltmann",
		"Tyler & The Grinch",
	],
}

var stock_icon_cred_dict = {
	"FenzoFRFR" : [ #13
		"Ace D. Copular",
		"All-Star Barkley",
		"gSports",
		"Gustavo Rocque",
		"Guzma",
		"Kid Cobra",
		"MAD/EON",
		"MONSTERMAU5",
		"Netherrack Nightmares",
		"Playing with Power",
		"Susie Haltmann",
		"Tony Stark",
		"Tyler & The Grinch",
	],
	"sunhatgirl" : [ #6
		"Bad Girlz",
		"Heaven Ascension DIO",
		"Hot Ones",
		"Painful Dreamers",
		"Rick Hentai",
		"Snailiens",
	],
	"TVGhost" : [ #5
		"Black Mamba Farquaad",
		"Forum Freakshow",
		"Painful Dreamers",
		"Scatman & Hatman",
		"Tyler & The Grinch",
	],
	"MS360" : [ #4
		"Club Bangers",
		"Dexter's Dad",
		"MTT! Tour",
		"Reanimatedd",
	],
	"5Kids" : [ #3
		"Elliana",
		"Head Chef Heavy",
		"Scatman & Hatman",
	],
	"Speed Wielder" : [ #3
		"Cadence",
		"Lofi Girl",
		"River City Girls",
	],
	"Rose Shrimp" : [ #2
		"Neil Cipher",
		"Scott the Woz",
	],
	"Pokopakku" : [ #2
		"Lil Darkie",
		"Ruler of Everything"
	],
	"Coach" : [ #2
		"Netherrack Nightmares",
		"Tyler & The Grinch",
	],
	"Crack Frost" : [ #1
		"Discoholic",
	],
	"DiamondBrickZ" : [ #1
		"Cici",
	],
	"cinnamonspiders" : [ #1
		"Lofi Girl",
	],
	"Anonymous" : [ #2
		"Detective Hat Kid",
		"MONSTERMAU5",
	],
	"???" : [ #1, need to be at end
		"Misc. Icon Base (Megamix Discord Icon without background)"
	],
}

var other_art_cred_dict = {
	"Parsee" : [ #7
		"Baba Dance Animation",
		"Fatman Scoops Dance Animation",
		"Flat Eric Dance Animation 1",
		"Flat Eric Dance Animation 2",
		"Keitai Dance Animation",
		"Rick Hentai Dance Animation 1",
		"Rick Hentai Dance Animation 2",
	],
	"HughMann" : [ #7
		"Baba Dance Animation",
		"Fatman Scoops Dance Animation",
		"Flat Eric Dance Animation 1",
		"Flat Eric Dance Animation 2",
		"Keitai Dance Animation",
		"Rick Hentai Dance Animation 1",
		"Rick Hentai Dance Animation 2",
	],
	"theguy" : [ #4... or like 9
		"GIFfany Neil Cipher Fight Animation",
		"Rumble McSkirmish Ruler of Everything Fight Animation",
		"All 5 versions of the Split Desicion Animations",
		"Probable Spamton Head Art (Pulled from Secam to the Pipis and was Used in the Misc. Stock Icon)"
	],
	"Crack Frost" : [ #3
		"Farquaad Silouhette Run Animation",
		"Kyoko Silouhette Run Animation",
		"Misako Silouhette Run Animation",
	],
	"quack-sol" : [ #2
		"Forum Freakshow Dance Animation",
		"Lil Darkie Dance Animation",
	],
	"aeiouko" : [ #2
		"Tony Stark (Pulled from Remix Week art and was used in the Misc. Stock Icon)",
		"Garfield Phone (Pulled from Remix Week art and was used in the Misc. Stock Icon)",
		],
	"5Kids" : [ #1
		"Spinel Guest Art (Used in the Misc. Stock Icon)",
	],
	"Speed_Wielder" : [ #1... or like 5?
		"All 5 versions of the Split Desicion Animations"
	],
	"Rose Shrimp" : [ #1
		"Lemon Demon (Pulled from Take Back The Hall Pt. 5 and was used in the Misc. Stock Icon)",
	],
	"EvKem" : [ #1
		"Manbo! (Pulled from Super Samba RPG and was Used in the Misc. Stock Icon)"
	],
	"autumn.left" : [ #1
		"Cici Running Animation"
	],
	"???" : [ #2 but stays at end
		"Character Nameplates",
		"Background Image (Pulled from Bracket Winners Round 2 which credits practically everyone on the art team)"
		],
	}

@onready var artist_credits_screen: Control = $"Artist Credits Screen"
@onready var art_box_container: VBoxContainer = $"Artist Credits Screen/ScrollContainer/VBoxContainer"
@onready var full_art_credits: Label = $"Artist Credits Screen/ScrollContainer/VBoxContainer/Full Art Credits"
@onready var stock_icon_credits: Label = $"Artist Credits Screen/ScrollContainer/VBoxContainer/Stock Icon Credits"
@onready var other_art_credits: Label = $"Artist Credits Screen/ScrollContainer/VBoxContainer/Other Art Credits"


func _ready() -> void:
	take_a_bow(full_art_cred_dict)
	take_a_bow(stock_icon_cred_dict)
	take_a_bow(other_art_cred_dict)
	

func print_credits():
	print("Full Art Credits")
	var cred_out : String
	for cred in full_art_cred_dict.keys():
		cred_out = "-" + cred + ": "
		for art in full_art_cred_dict[cred]:
			cred_out += art + ", "
		print(cred_out.rstrip(", "))
	print("\nStock Icon Credits")
	for cred in stock_icon_cred_dict.keys():
		cred_out = "-" + cred + ": "
		for art in stock_icon_cred_dict[cred]:
			cred_out += art + ", "
		print(cred_out.rstrip(", "))
	print("\nOther Icon Credits")
	for cred in other_art_cred_dict.keys():
		cred_out = "-" + cred + ": "
		for art in other_art_cred_dict[cred]:
			cred_out += art + ", "
		print(cred_out.rstrip(", "))


func take_a_bow(art_dict):
	var label
	var label_inst
	var i = 0
	for artist in art_dict.keys():
		i += 1
		label_inst = Label.new()
		#label_inst = label.instantiate()
		label_inst.autowrap_mode = 2
		label_inst.add_theme_color_override("font_outline_color", Color.BLACK)
		label_inst.add_theme_constant_override("outline_size", 10)
		label_inst.add_theme_font_size_override("font_size", 13.5)
		label_inst.text = artist + ": "
		for art in art_dict[artist]:
			label_inst.text += art + ", "
		label_inst.text = label_inst.text.rstrip(", ")
		art_box_container.add_child(label_inst)
		if art_dict == full_art_cred_dict:
			art_box_container.move_child(label_inst, full_art_credits.get_index() + i)
		elif art_dict == stock_icon_cred_dict:
			art_box_container.move_child(label_inst, stock_icon_credits.get_index() + i)
		else:
			art_box_container.move_child(label_inst, other_art_credits.get_index() + i)
