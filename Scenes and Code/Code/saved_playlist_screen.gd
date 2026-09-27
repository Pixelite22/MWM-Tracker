extends Control

signal kick_it

@onready var v_box_container: VBoxContainer = $ScrollContainer/VBoxContainer

var playlist_list = []
var button_dict = {} # {button : pressed bool}
var button_edited
@onready var held_timer: Timer = $Timer

@onready var name_change_popup: Control = $"Name Change Popup"
@onready var name_change_text: LineEdit = $"Name Change Popup/Name Change Text"
@onready var save_button: Button = $"Name Change Popup/Save Button"




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#connect relevant signals
	Global.saved_playlist_show.connect(load_em_up)
	held_timer.timeout.connect(name_changer)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#Simply to load the playlist and send it to the function that sorts out the relevant information
func load_em_up():
	print("Load em up reached")
	var file_content = Global.load_playlists()
	
	sort_em_out(file_content)
	
	#release_da_buttons()

#Sorts out the collected info from the playlist
func sort_em_out(playlists : String):
	print("SEM reached")
	print(playlists.strip_escapes())
	var split_point = playlists.find("http", 4) #Find the start of the link, on the off-chance it isn't at the very beginning
	var start_of_name_requests = playlists.find(" Named: ") + 8 #find the start of the Playlist name part
	var end_char = playlists.find("|")
	Global.playlist_dict.set(playlists.substr(0, start_of_name_requests - 8), playlists.substr(start_of_name_requests, end_char - start_of_name_requests).rstrip("|")) 
	#playlist_list.append(playlists.strip_escapes().substr(0, split_point))
	print(Global.playlist_dict)
	if playlists.substr(split_point) != "":
		print(playlists.substr(split_point))
		sort_em_out(playlists.substr(split_point))
	else:
		print("ending SEM")
		release_da_buttons()




func release_da_buttons():
	print("RDB reached")
	for playlist in Global.playlist_dict:
		var new_button = Button.new()
		
		if Global.playlist_dict[playlist] == "":
			new_button.text = playlist
		else:
			new_button.text = Global.playlist_dict[playlist]
		new_button.button_down.connect(button_down.bind(new_button, playlist))
		new_button.button_up.connect(button_up.bind(new_button, playlist))
		new_button.alignment = HORIZONTAL_ALIGNMENT_CENTER
		new_button.custom_minimum_size = Vector2(444, 86)
		button_dict.get_or_add(new_button, false)
		
		v_box_container.add_child(new_button)

var curr_focused_button : Array
func button_down(button, playlist):
	print("Button Pushed Down")
	button_dict[button] = true
	button_edited = button
	held_timer.wait_time = 1.5
	held_timer.start()
	
	curr_focused_button = [button, playlist]

func button_up(button, playlist):
	print("Button let go")
	button_dict[button] = false
	held_timer.stop()
	if not name_change_popup.visible:
		imma_firin_my_playzar(playlist)


func _on_timer_timeout() -> void:
	print("Button held")
	for button in button_dict:
		if button_dict[button]:
			name_changer()


func imma_firin_my_playzar(playlist_link):
	print("BLARG")
	var playlist_id_start = playlist_link.find("list=") + 5
	if playlist_link.contains("&"):
		Global.playlist_id = playlist_link.substr(playlist_id_start, playlist_link.find("&") - 1)
	else:
		Global.playlist_id = playlist_link.substr(playlist_id_start)
	
	kick_it.emit()

func name_changer():
	name_change_popup.show()



func _on_save_button_pressed() -> void:
#	curr_focused_button[0].text = name_change_text.text
#	button_dict[curr_focused_button[0]] = name_change_text.text
#	Global.playlist_dict[playlist] = name_change_text.text
	print("Save Button Pressed")
	if name_change_text.text != "" or name_change_text.text != name_change_text.placeholder_text:
		print("first if passed")
		if button_edited != null:
			print("BUtton edited is" + button_edited.text)
#			if (button_edited.text in Global.playlist_dict.values()) or button_edited.text in Global.playlist_dict.keys():
#				print(button_edited.text + " found in the global dictionary!")
#				for playlist in Global.playlist_dict:
#					if playlist == button_edited.text or Global.playlist_dict[playlist] == button_edited.text:
#						print("Found in loop!")
#						Global.save_playlists(playlist, name_change_text.text)
						
				
			for playlist in Global.playlist_dict:
				if button_edited.text == playlist or button_edited.text == Global.playlist_dict[playlist]:
					print(button_edited.text + "matched")
					#Global.playlist_dict[playlist] = name_change_text.text
					Global.save_playlists(playlist, name_change_text.text)
				else:
					print("Playlist or playlist named: " + button_edited.text + " not found!")
			
			button_edited.text = name_change_text.text
			name_change_text.text = ""
			name_change_popup.hide()
