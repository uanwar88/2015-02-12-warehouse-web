module Logic
  def self.add(name)
    DATABASE.execute("INSERT INTO #{@loc_cat} (name) VALUES ('#{name}')")
  end

#list al categories
  def self.list_all
    DATABASE.execute("SELECT * FROM #{@loc_cat}")
  end

#list individual category by id
  def self.list_one(value)
    DATABASE.execute("SELECT * FROM #{@loc_cat} WHERE id = #{value}")
  end

#delete a category by id or name
  def self.delete(value)
    if value.is_a?(Integer)
      DATABASE.execute("DELETE FROM #{@loc_cat} WHERE id = #{value}")
    else
      DATABASE.execute("DELETE FROM #{@loc_cat} WHERE name = '#{value}'")
    end
  end

#update a category name by id
  def self.update(name,id)
    DATABASE.execute("UPDATE #{@loc_cat} SET name = '#{name}' WHERE id = #{id}")
  end
end
