extends Control

@onready var http_request: HTTPRequest = $HTTPRequest
@onready var icon_container: VBoxContainer = $"ScrollContainer/Icon Container"

var page

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.roll_call()
	Global.set_playlist() #builds the starting link
	
	request_page()

func request_page():
	if not http_request.request_completed.is_connected(page_read):
		http_request.request_completed.connect(page_read)
	http_request.request(Global.link)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func page_read(result, response_code, headers, body):
	page = JSON.parse_string(body.get_string_from_utf8())
	
	char_catcher()
	icon_container.update_stats()
	next_page()

func char_catcher():
	for descrips in page["items"]:
		var description = descrips["snippet"]["description"]
		var str_start
		var str_end
		if description.contains("Character Represented: "):
			str_start = description.find("Character Represented: ")
			str_end = description.find("\n", str_start)
			character_increment(description.substr(str_start + 23, str_end - (str_start + 23)))
		elif description.contains("Characters Represented: "):
			str_start = description.find("Characters Represented: ")
			str_end = description.find("\n", str_start)
			character_increment(description.substr(str_start + 24, str_end - (str_start + 24)))

func character_increment(chars_repped):
	for character in Global.char_dict:
		if chars_repped.contains(character):
			print(character + " found!")
			Global.char_dict[character][0] += 1
			if not chars_repped.contains(","):
				Global.char_dict[character][1] += 1
			else:
				Global.char_dict[character][2] += 1

func next_page():
	if page["nextPageToken"] != null:
		Global.next_page_key = page["nextPageToken"]
#		Global.prev_page_key = Global.curr_page_key
#		Global.curr_page_key = Global.next_page_key
		Global.next_page()
		request_page()
