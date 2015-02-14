module Logic
  # Description: Will add a new location or category to the database.
  # Params:
  # + name: String
  def add(name)
    DATABASE.execute("INSERT INTO #{@loc_cat} (name) VALUES ('#{name}')")
  end

#Description: list all categories or locations
  def list_all
    DATABASE.execute("SELECT * FROM #{@loc_cat}")
  end

#Description: list individual category or location by ID
#Params:
#+ value: Integer, ID of category or location
#Returns: An array containing a hash.
  def list_one(value)
    DATABASE.execute("SELECT * FROM #{@loc_cat} WHERE id = #{value}")
  end

#Description: delete a category by id or name from the database.
#Params:
#+ value: String or Integer
  def delete(value)
    if value.is_a?(Integer)
      DATABASE.execute("DELETE FROM #{@loc_cat} WHERE id = #{value}")
    else
      DATABASE.execute("DELETE FROM #{@loc_cat} WHERE name = '#{value}'")
    end
  end

#Description: update a category name by id
#Params:
#+ name: String, New name of category or location
#+ id: Integer
  def update(name,id)
    DATABASE.execute("UPDATE #{@loc_cat} SET name = '#{name}' WHERE id = #{id}")
  end
end
