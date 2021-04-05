extends Node
class_name Game

var egg_count = 0
var increment_value = 1
var items = []
var items_specs = [
	["Clicker", "res://assets/img/clicker.png", 3], 
	["Chicken", "res://assets/img/poule.png", 7], 
	["Coq", "res://assets/img/clicker.png", 12] ]
	
onready var item_button_list = get_node("HBoxContainer/MarginContainer2/VBoxContainer")
onready var egg_counter = get_node("HBoxContainer/MarginContainer/VBoxContainer/EggCounter")

export var inflation_factor:float = 0.0

func _ready():
	init_items()


func init_items() -> void:
	var Item_button_scene = preload("res://scenes/ItemScene.tscn")
	for spec in items_specs:
		var item = Item.new(spec[0], spec[1], spec[2])
		add_item(item)
		var item_button = Item_button_scene.instance()
		item_button.init(item)
		item_button_list.add_child(item_button)
	refresh_item_list()


func get_egg_count() -> int:
	return egg_count


func increment() -> void:
	egg_count += increment_value


func set_increment(value:int) -> void:
	increment_value = value


func spend(amount:int) -> bool:
	if amount <= egg_count :
		egg_count -= amount
		return true
	else:
		return false


func add_item(item) -> void:
	items.append(item)
	

func get_items():
	return items


func buy(item, quantity) -> bool:
	if egg_count >= item.get_price() * quantity :
		increase_item_price(item, quantity)
		item.add_to_count(quantity)
		return true
	else :
		return false


func increase_item_price (item, quantity) -> void :
	item.set_price(int(float(item.get_price()) * pow(1.0 + inflation_factor, quantity)))


func set_inflation_factor(factor:float) -> void:
	inflation_factor = factor


func refresh_egg_counter(): 
	egg_counter.text = "%s eggs" % get_egg_count()

func refresh_item_list():
	for item_scene in item_button_list.get_children():
		item_scene.disabled = get_egg_count() >= item_scene.get_item().get_price()
		
			
func _on_egg_pressed():
	increment()
	refresh_egg_counter()
	refresh_item_list()
