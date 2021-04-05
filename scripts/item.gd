class_name Item

var count:int = 0
var price:int = 0
var title = ""
var icon_path = ""

func _init(_title, _icon_path, _price):
	set_title(_title)
	set_price(_price)
	set_icon_path(_icon_path)

func get_price() -> int:
	return price


func set_price(_price) -> void:
	price = _price


func set_title(_title) -> void:
	title = _title


func get_title() -> String:
	return title


func set_icon_path(_icon_path) -> void:
	icon_path = _icon_path

func get_icon_path() -> String:
	return icon_path
	

func add_to_count(quantity:int) -> void:
	count += quantity

func get_count() -> int:
	return count
	

