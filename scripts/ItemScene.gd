extends Button
class_name ItemScene

var item:Item
var available = null
var unavailable = null

onready var item_button = find_node("ItemButton")
onready var item_icon = find_node("ItemIcon")
onready var item_title = find_node("ItemTitle")
onready var item_count = find_node("ItemCount")
onready var item_price = find_node("ItemPrice")

func init(_item:Item):
	item = _item
	
func _ready() -> void:
	
	available = self.theme
	available.set_color("bg_color", "Panel", Color.blue)
	
	unavailable = available.duplicate()
	unavailable.set_color("bg_color", "Panel", Color.red)
	
	item_title.text = item.get_title()
	item_count.text = "%s" % item.get_count()
	item_price.text = "%s" % item.get_price()
	item_icon.texture = load(item.get_icon_path())
#	
func get_item() -> Item:
	return item
