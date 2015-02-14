class Item
  attr_accessor :item_id, :item_name, :item_cat, :item_loc, :item_quant, :item_price, :item_desc

  def initialize(options)
    @item_name = options["name"].downcase
    @item_cat = options["category"].to_i
    @item_loc = options["location"].to_i
    @item_quant = options["quantity"].to_i
    @item_price = options["cost"]
    @item_desc = options["description"]
  end

  # Description: Insert Item object into database.
  #                 Object instance variables are processed into query string.
  def insert
    attributes = []
    instance_variables.each { |i|
      attributes << i.to_s.delete("@")
    }

    query_components_array = []
    attributes.each { |x|
      value = self.send(x)

      if value.is_a?(Integer)
        query_components_array << "#{value}"
      else
        query_components_array << "'#{value}'"
      end
    }

    query_string = query_components_array.join(", ")

    DATABASE.execute("INSERT INTO items (name, category, location, quantity, cost, description) VALUES (#{query_string})")
    @item_id = DATABASE.last_insert_row_id
  end

  #Description: delete item by id or name from database
  #Params:
  #+ value: String or Integer, name or id of Item
  def self.delete(value)
    if value.is_a?(Integer)
      DATABASE.execute("DELETE FROM items WHERE id = #{value}")
    else
      DATABASE.execute("DELETE FROM items WHERE name = '#{value}'")
    end
  end

#Description: list all items, name and ids only.
#Returns: an array containing hashes of items, each with 2 key value pairs for id and name
  def self.list_items
    DATABASE.execute("SELECT id, name FROM items")
  end

#Description: list all items including all fields.
#Returns: An array containing multiple hashes, each with values corresponding to each instance variable
  def self.list_items_details
    DATABASE.execute("SELECT * FROM items")
  end

#Description: fetch all item details for a single item by id, name, category, location.
#+ name: String or Integer; Can be id, name, category, or location
#+ num: Integer; Specificies type of request; 1: id, 2: name, 3: category, 4: location
#Returns: An array containing a hash
  def self.fetch_item_by(input,num)
    if num == 1
      DATABASE.execute("SELECT * FROM items WHERE id = #{input}")
    elsif num == 2
      DATABASE.execute("SELECT * FROM items WHERE name = '#{input}'")
    elsif num == 3
      DATABASE.execute("SELECT * FROM items WHERE category = '#{input}'")
    else
      DATABASE.execute("SELECT * FROM items WHERE location = '#{input}'")
    end
  end

#Description: edit or upate all item details by id or name.
#Params:
# + item_name: String
# + item_cat: Integer
# + item_loc: Integer
# + item_quant: Integer
# + item_price: Float
# + item_desc: String
# + input: Integer; Specifies update by ID or by Name; 1: ID, 2: name
  def self.edit(item_name,item_cat,item_loc,item_quant,item_price,item_desc,input)
    if input.is_a?(Integer)
      DATABASE.execute("UPDATE items SET name = '#{item_name}', category = '#{item_cat}', location = '#{item_loc}', quantity = #{item_quant},
      cost = #{item_price}, description = '#{item_desc}' WHERE id = #{input}")
    else
      DATABASE.execute("UPDATE items SET name = '#{item_name}', category = '#{item_cat}', location = '#{item_loc}', quantity = #{item_quant},
      cost = #{item_price}, description = '#{item_desc}' WHERE name = '#{input}'")
    end
  end
end
