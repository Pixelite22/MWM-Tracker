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
	for character in Global.char_dict:
		#print("Icon for character " + character + " is being added.")
		var icon = icon_node.instantiate()
		icon.character = character
		add_child(icon)

func move_button():
	move_child(stats_screen_button, -1)

func update_stats():
	for child in get_children():
		if not child is Button:
			child.update_stats()

func song_sorter(character, song_name):
	for child in get_children():
		if not child is Button:
			if child.character == character:
				child.songs_included.append(song_name)

func song_reset():
	for child in get_children():
		if not child is Button:
			child.item_list.clear()
			child.songs_included.clear()
