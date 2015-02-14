require 'pry'
require 'minitest/autorun'
require 'sqlite3'
require_relative 'database_setup'

require_relative 'item0'



class ItemTest <  Minitest::Test
  def test_edit_method
    options = {"name" => "Apples", "category" => "Fruit", 'location' => "Midtown", 'quantity' => 290, 'cost' => 1, "description" => "Red." }
    puts options
    item = Item.new(options)
    item.insert
    Item.edit("Apples","Fruit","Uptown",250,1.23,"Red and round.",item.item_id)
    new_item = Item.fetch_item_by(item.item_id,1)
    new_item = new_item[0]
    retrieved_hash = new_item.delete_if { |x,y| !["name", "category", "location", "quantity", "cost", "description"].include?(x) }
    puts retrieved_hash
    refute_equal(options, retrieved_hash)
  end
end
