class Category
  def self.add(name)
    DATABASE.execute("INSERT INTO categories (name) VALUES ('#{name}')")
  end

  def self.list_cats
    DATABASE.execute("SELECT * FROM categories")
  end

  def self.list_cat(value)
    DATABASE.execute("SELECT * FROM categories WHERE id = #{value}")
  end

  def self.delete(value)
    if value.is_a?(Integer)
      DATABASE.execute("DELETE FROM categories WHERE id = #{value}")
    else
      DATABASE.execute("DELETE FROM categories WHERE name = '#{value}'")
    end
  end

end
