extends Control

signal kick_it

@onready var v_box_container: VBoxContainer = $ScrollContainer/VBoxContainer

var playlist_list = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.saved_playlist_show.connect(load_em_up)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_em_up():
	print("Load em up reached")
	var file_content = Global.load_playlists()
	
	sort_em_out(file_content)
	
	#release_da_buttons()

func sort_em_out(playlists : String):
	print("SEM reached")
	print(playlists.strip_escapes())
	var split_point = playlists.strip_escapes().find("http", 4)
	playlist_list.append(playlists.strip_escapes().substr(0, split_point))
	print(playlist_list)
	if playlists.substr(split_point) != "":
		print(playlists.substr(split_point))
		sort_em_out(playlists.substr(split_point))
	else:
		print("ending SEM")
		release_da_buttons()

func release_da_buttons():
	print("RDB reached")
	for playlist in playlist_list:
		var new_button = Button.new()
		
		new_button.text = playlist
		new_button.pressed.connect(imma_firin_my_playzar.bind(playlist))
		new_button.alignment = HORIZONTAL_ALIGNMENT_CENTER
		new_button.custom_minimum_size = Vector2(444, 86)
		
		v_box_container.add_child(new_button)

func imma_firin_my_playzar(playlist_link):
	print("BLARG")
	var playlist_id_start = playlist_link.find("list=") + 5
	if playlist_link.contains("&"):
		Global.playlist_id = playlist_link.substr(playlist_id_start, playlist_link.find("&") - 1)
	else:
		Global.playlist_id = playlist_link.substr(playlist_id_start)
	
	kick_it.emit()
