DATABASE = SQLite3::Database.new("farmyard.db")

#results presented as hashes
DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS categories (id INTEGER PRIMARY KEY, name TEXT)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS locations (id INTEGER PRIMARY KEY, name TEXT)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS items (id INTEGER PRIMARY KEY, name TEXT, category INTEGER, location INTEGER,
  quantity INTEGER, cost INTEGER, description TEXT)")
