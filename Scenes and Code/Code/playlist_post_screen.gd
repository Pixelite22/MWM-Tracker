extends Control

signal playlist_button_pressed
signal saved_playlist_show

@onready var playlist_entry: LineEdit = $"Playlist Entry"
@onready var go_button: Button = $"Go Button"
@onready var saved_playlists_button: Button = $"Saved Playlists Button"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	print("Button Pressed") 
	var playlist_id_start = playlist_entry.text.find("list=") + 5 #
	print(playlist_entry.text.substr(playlist_id_start))
	if playlist_entry.text.contains("&"):
		Global.playlist_id = playlist_entry.text.substr(playlist_id_start, playlist_entry.text.find("&") - 1)
	else:
		Global.playlist_id = playlist_entry.text.substr(playlist_id_start)
	
	Global.save_playlists(playlist_entry.text)
	
	print(Global.load_playlists())
	
	playlist_button_pressed.emit()


func _on_saved_playlists_button_pressed() -> void:
	saved_playlist_show.emit()
	
