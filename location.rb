class Location
  def self.add(name)
    DATABASE.execute("INSERT INTO locations (name) VALUES ('#{name}')")
  end
  
  def self.list_locations
    DATABASE.execute("SELECT * FROM locations")
  end  
  
  def self.delete(value)
    if value.is_a?(Integer)
      DATABASE.execute("DELETE FROM locations WHERE id = #{value}")
    else
      DATABASE.execute("DELETE FROM locations WHERE name = '#{value}'")
    end
  end
end