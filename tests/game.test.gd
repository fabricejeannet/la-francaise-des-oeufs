extends WAT.Test

var game = null

func pre():
	game = Game.new()


func test_game_starts_with_zero_egg() -> void:
	asserts.is_equal(game.get_egg_count(), 0)


func test_game_first_increments_total_with_one() -> void:
	game.increment()
	asserts.is_equal(game.get_egg_count(), 1)	


func test_increments_total_with_the_right_amount_when_an_increment_is_set() -> void:
	game.set_increment(4)
	game.increment()
	asserts.is_equal(game.get_egg_count(), 4)	


func test_can_spend_eggs() -> void:
	game.set_increment(10)
	game.increment()
	game.spend(8)
	asserts.is_equal(game.get_egg_count(), 2)	


func test_cant_spend_more_eggs_than_you_have() -> void :
	game.set_increment(5)
	game.increment()
	asserts.is_false(game.spend(8))
	asserts.is_equal(game.get_egg_count(), 5)	


func test_can_add_item_to_game() -> void :
	var item = Item.new()
	game.add_item(item)
	asserts.is_equal(game.get_items().size(), 1)


func test_buying_an_item_increases_its_price() -> void:
	var item = Item.new()
	item.price = 15
	game.set_inflation_factor(0.15)
	game.set_increment(200)
	game.increment()
	game.buy(item, 8)
	asserts.is_equal(item.get_price(), 45)
	
	
func test_cant_buy_item_if_you_dont_have_enough_eggs() -> void:
	var item = Item.new()
	item.price = 2
	game.add_item(item)
	game.increment()
	asserts.is_false(game.buy(item, 1))



#func test_buying_an_item_updates_its_labels() -> void:
#	var item = Item.new()
#	item.price = 15
#	game.add_item(item)
#
#	game.set_inflation_factor(0.15)
#	game.set_increment(200)
#	game.increment()
#	game.buy(item, 8)
#	asserts.is_equal(item.get_price(), item.price_label.text)
#
#

