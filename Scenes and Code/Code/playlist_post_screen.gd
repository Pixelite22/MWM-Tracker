extends Control

signal playlist_button_pressed
signal saved_playlist_show

@onready var playlist_entry: LineEdit = $"Playlist Entry"
@onready var go_button: Button = $"Go Button"
@onready var saved_playlists_button: Button = $"Saved Playlists Button"
@onready var icon: TextureRect = $Icon
@onready var icon_sprite: Sprite2D = $"Icon Sprite"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	icon_beat()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if visible and tween and tween.is_valid() and not tween.is_running():
		icon_beat()


func _on_button_pressed() -> void:
	#print("Button Pressed") 
	if playlist_entry.text != "":
		var playlist_id_start = playlist_entry.text.find("list=") + 5 #
		#print(playlist_entry.text.substr(playlist_id_start))
		if playlist_entry.text.contains("&"):
			Global.playlist_id = playlist_entry.text.substr(playlist_id_start, playlist_entry.text.find("&"))
		else:
			Global.playlist_id = playlist_entry.text.substr(playlist_id_start)
		
		Global.save_playlists(playlist_entry.text)
		
		#print(Global.load_playlists())
		
		#await icon_transed
		
		playlist_button_pressed.emit()
	else:
		pass


func _on_saved_playlists_button_pressed() -> void:
	saved_playlist_show.emit()
	

signal icon_transed
var tween : Tween = create_tween()
func icon_beat():
	if tween: #If tween is already in use
		tween.kill() #kill it
	tween = create_tween() #and create a new one
	tween.set_loops() #then set the following properties to loop with each other
	tween.tween_property(icon_sprite, "scale", Vector2(0.4, 0.4) * Vector2(0.75, 0.75), 1.5) #Have the heart shrink to 1/4th the size
	tween.tween_property(icon_sprite, "scale", Vector2(0.4, 0.4), 1.5) #then grow back to normal
	#tween.stop()
	get_tree().create_timer(0.1).timeout #then await a very small timeout before restarting the loop
