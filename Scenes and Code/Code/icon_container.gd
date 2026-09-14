extends VBoxContainer

var icon_node = preload("res://Scenes and Code/Scenes/Character Icons.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_icons()
	
#	for child in get_children():
#		child.update_stats()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_icons():
	for character in Global.char_dict:
		#print("Icon for character " + character + " is being added.")
		var icon = icon_node.instantiate()
		icon.character = character
		add_child(icon)

func update_stats():
	for child in get_children():
		child.update_stats()

func song_sorter(character, song_name):
	for child in get_children():
		if child.character == character:
			child.songs_included.append(song_name)
