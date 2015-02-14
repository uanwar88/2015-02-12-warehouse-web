class Location
  #add a new location
  @loc_cat = "locations"
  extend Logic
#   def self.add(name)
#     DATABASE.execute("INSERT INTO locations (name) VALUES ('#{name}')")
#   end
#
#   #select all locations
#   def self.list_locations
#     DATABASE.execute("SELECT * FROM locations")
#   end
#
# #list individual location by id
#   def self.list_loc(value)
#     DATABASE.execute("SELECT * FROM locations WHERE id = #{value}")
#   end
#
# #delete a location by id or name
#   def self.delete(value)
#     if value.is_a?(Integer)
#       DATABASE.execute("DELETE FROM locations WHERE id = #{value}")
#     else
#       DATABASE.execute("DELETE FROM locations WHERE name = '#{value}'")
#     end
#   end
#
# #update a location name by id
#   def self.update(name,id)
#     DATABASE.execute("UPDATE locations SET name = '#{name}' WHERE id = #{id}")
#   end
end
