class Category
  @loc_cat = "categories"
  extend Logic
  #add a new category
#   def self.add(name)
#     DATABASE.execute("INSERT INTO categories (name) VALUES ('#{name}')")
#   end
#
# #list al categories
#   def self.list_cats
#     DATABASE.execute("SELECT * FROM categories")
#   end
#
# #list individual category by id
#   def self.list_cat(value)
#     DATABASE.execute("SELECT * FROM categories WHERE id = #{value}")
#   end
#
# #delete a category by id or name
#   def self.delete(value)
#     if value.is_a?(Integer)
#       DATABASE.execute("DELETE FROM categories WHERE id = #{value}")
#     else
#       DATABASE.execute("DELETE FROM categories WHERE name = '#{value}'")
#     end
#   end
#
# #update a category name by id
#   def self.update(name,id)
#     DATABASE.execute("UPDATE categories SET name = '#{name}' WHERE id = #{id}")
#   end
end
